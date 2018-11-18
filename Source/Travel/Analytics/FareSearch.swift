//
//  FareSearch.swift
//  Amadeus
//
//  Created by Charly Maxter on 18/11/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation
import SwiftyJSON

fileprivate let fareSearch = "v1/travel/analytics/fare-searches"

/// A namespaced client for the `v1/travel/analytics/fare-searches` endpoints
///
/// Access via the `Amadeus` object
/// ```
/// let amadeus = Amadeus(client_id, client_secret)
/// amadeus.travel.analytics.fareSearch
/// ```
public class FareSearch{
    
    private var client: Client
    
    public init(client:Client) {
        self.client = client
    }
    
    /// The Fare Search History API allows to find the number of
    /// estimated searches from an origin, optionally a destination,
    /// within a time period when travelers are performing the searches.
    ///
    ///   ## Example
    ///   Find the air traffic from Nice in August 2017 for the French market
    ///
    ///     ama.travel.analytics.fareSearch.get(
    ///         origin: "NCE",
    ///         sourceCountry: "FR",
    ///         period: "2018-11",
    ///         onCompletion: {
    ///             data in ...}
    ///     )
    ///
    /// - Parameters:
    ///     - origin: `String` IATA code of the origin city.
    ///     - sourceCountry: `String` IATA code of the country from which fare searches were made
    ///     - period: `String` period of search; can be a year or a month or a week. ISO format must be used - e.g. 2015
    ///              for year; 2015-05 for month and 2015-W04 for week. Period ranges are not supported. Only periods from year 2011-01 up
    ///              to current year and previous month or week are valid. Future dates are not supported.
    ///
    /// - Returns:
    ///    `JSON` object
    ///
    public func get(origin:String, sourceCountry:String, period:String, onCompletion: @escaping (JSON) -> Void){
        client.getAccessToken(onCompletion: {
            (auth) in
            if auth != "error" {
                let body = "?origin=\(origin)&sourceCountry=\(sourceCountry)&period=\(period)"
                makeHTTPGetRequestAuth(fareSearch, auth: auth, body: body, onCompletion: {
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
