//
//  Searched.swift
//  Amadeus
//
//  Created by Charly Maxter on 03/12/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation
import SwiftyJSON

fileprivate let searched = "v1/travel/analytics/air-traffic/searched"

/// A namespaced client for the `v1/travel/analytics/air-traffic/searched` endpoints
///
/// Access via the `Amadeus` object
/// ```
/// let amadeus = Amadeus(client_id, client_secret)
/// amadeus.travel.analytics.airTraffic.busiestPeriod
/// ```
public class Searched{
    
    private var client: Client
    
    public init(client:Client) {
        self.client = client
    }
    
    ///
    /// Returns a list of air traffic reports based on the number of people searching.
    ///
    ///   ## Example
    ///   Which were the most searched flight destinations from Madrid in August 2017?
    ///
    ///     ama.travel.analytics.airTraffic.searchedByDestination.get(data:
    ///         ["originCityCode":"MAD",
    ///         "marketCountryCode": "ES",
    ///         "searchPeriod": "2017-08"],
    ///         onCompletion: {
    ///             data in ...}
    ///     )
    /// - Parameters:
    ///    - originCityCode: `String` IATA code of the origin city - e.g. MAD for - required
    ///    - searchPeriod: `String` period when consumers are travelling in YYYY-MM format
    ///    - marketCountryCode: `String` IATA code of the country from which searches were made e.g. ``"ES"`` for Spain
    ///
    /// - Returns:
    ///    `JSON` object
    
    
    public func get(data: [String:String], onCompletion: @escaping (JSON) -> Void){
        client.getAccessToken(onCompletion: {
            (auth) in
            if auth != "error" {
                let body = generateGetParameters(data: data)
                makeHTTPGetRequestAuth(searched, auth: auth, body: body, client: self.client, onCompletion: {
                    data,err  in
                    if let error = err {
                        onCompletion(JSON(parseJSON: "{error:\(error)}"))
                    }else{
                        onCompletion(data)
                    }
                })
            }else{
                onCompletion("error")
            }
        })
    }
}

