//
//  searchedByDestination.swift
//  Amadeus
//
//  Created by Charly Maxter on 03/12/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation
import SwiftyJSON

fileprivate let searchedByDestination = "v1/travel/analytics/air-traffic/searched/by-destination"

/// A namespaced client for the `v1/travel/analytics/air-traffic/busiest-period` endpoints
///
/// Access via the `Amadeus` object
/// ```
/// let amadeus = Amadeus(client_id, client_secret)
/// amadeus.travel.analytics.airTraffic.busiestPeriod
/// ```
public class SearchedByDestination{
    
    private var client: Client
    
    public init(client:Client) {
        self.client = client
    }
    
    public func get(data: [String:String], onCompletion: @escaping (JSON) -> Void){
        client.getAccessToken(onCompletion: {
            (auth) in
            if auth != "error" {
                let body = generateGetParameters(data: data)
                makeHTTPGetRequestAuth(searchedByDestination, auth: auth, body: body, onCompletion: {
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

