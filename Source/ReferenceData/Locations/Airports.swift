//
//  Airports.swift
//  Amadeus
//
//  Created by Charly Maxter on 18/11/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation
import SwiftyJSON

fileprivate let airports = "v1/reference-data/locations/airports"

/// A namespaced client for the `v2/reference-data/locations/airports` endpoints
///
/// Access via the `Amadeus` object
/// ```swift
/// let amadeus = Amadeus(client_id, secret_id)
/// amadeus.referenceData.locations.airports
/// ```
public class Airports{
    
    private var client: Client
    
    public init(client:Client) {
        self.client = client
    }
    
    /// Returns a list of relevant airports near to a given point.
    ///
    ///   ## Example
    ///   Find the nearest airport to the 49.0000,2.55 lat/long
    ///
    ///     amadeus.referenceData.locations.airports.get(
    ///         longitude:49.0000,
    ///         latitude:2.55,
    ///         onCompletion: {
    ///             data in ...}
    ///     )
    /// - Parameters:
    ///    - longitude: `Double` longitude location to be at the center of the search circle.
    ///    - latitude: `Double` latitude location to be at the center of the search circle.
    ///
    /// - Returns:
    ///    `JSON` object
    public func get(data: [String:String], onCompletion: @escaping (JSON) -> Void){
        client.getAccessToken(onCompletion: {
            (auth) in
            if auth != "error" {
                let body = generateGetParameters(data: data)
                makeHTTPGetRequestAuth(airports, auth: auth, body: body, onCompletion: {
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
