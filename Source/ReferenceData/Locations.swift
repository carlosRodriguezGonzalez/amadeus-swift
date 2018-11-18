//
//  Locations.swift
//  Amadeus
//
//  Created by Charly Maxter on 18/11/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation
import SwiftyJSON

fileprivate let locations = "v1/reference-data/locations"

/// A namespaced client for the `v2/reference-data/locations` endpoints
///
/// Access via the `Amadeus` object
/// ```swift
/// let amadeus = Amadeus(client_id, secret_id)
/// amadeus.referenceData.locations
/// ```
public class Locations{
    
    private let client: Client
    public let airports:Airports
    
    public init(client:Client) {
        self.client = client
        airports = Airports(client: client)
    }
    
    /// Returns a list of airports and cities matching a given keyword.
    ///
    ///   ## Example
    ///   Find any location starting with 'lon'
    ///
    ///     amadeus.referenceData.locations.get(
    ///         subType:"AIRPORT,CITY",
    ///         keyword:"lon",
    ///         onCompletion: {
    ///             data in ...}
    ///     )
    /// - Parameters:
    ///    - subType: `String` Type of location to search for
    ///    - keyword: `String` That should represent the start of a word in a city or airport name or code.
    ///
    /// - Returns:
    ///    `JSON` object
    public func get(subType:String, keyword:String, onCompletion: @escaping (JSON) -> Void){
        client.getAccessToken(onCompletion: {
            (auth) in
            if auth != "error" {
                let body = "?subType=\(subType)&keyword=\(keyword)"
                makeHTTPGetRequestAuth(locations, auth: auth, body: body, onCompletion: {
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
