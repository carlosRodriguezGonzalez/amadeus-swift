//
//  BusiestPeriod.swift
//  Amadeus
//
//  Created by Charly Maxter on 18/11/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation
import SwiftyJSON

fileprivate let busiestPeriod = "v1/travel/analytics/air-traffic/busiest-period"

/// A namespaced client for the `v1/travel/analytics/air-traffic/busiest-period` endpoints
///
/// Access via the `Amadeus` object
/// ```
/// let amadeus = Amadeus(client_id, client_secret)
/// amadeus.travel.analytics.airTraffic.busiestPeriod
/// ```
public class BusiestPeriod{
    
    private var client: Client
    
    public init(client:Client) {
        self.client = client
    }
    
    /// Returns a list of air traffic reports.
    ///
    ///   ## Example
    ///   Find the air traffic for travelers arriving in Paris in 2017
    ///
    ///     amadeus.travel.analytics.airTraffic.busiestPeriod.get(
    ///         cityCode:"PAR",
    ///         period: "2017",
    ///         direction: "arriving",
    ///         onCompletion: {
    ///             data in ...}
    ///     )
    /// - Parameters:
    ///    - cityCode: `String` IATA code of the origin city.
    ///    - period: `String` period when consumers are travelling in `YYYY` format
    ///
    /// - Returns:
    ///    `JSON` object
    public func get(cityCode:String, period:String, direction:String, onCompletion: @escaping (JSON) -> Void){
        client.getAccessToken(onCompletion: {
            (auth) in
            if auth != "error" {
                let body = "?cityCode=\(cityCode)&period=\(period)&direction=\(direction)"
                makeHTTPGetRequestAuth(busiestPeriod, auth: auth, body: body, onCompletion: {
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
