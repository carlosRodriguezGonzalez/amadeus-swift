//
//  AirLines.swift
//  Amadeus
//
//  Created by Charly Maxter on 18/11/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation
import SwiftyJSON

fileprivate let airLines = "v1/reference-data/airlines"

/// A namespaced client for the `v1/reference-data/airlines` endpoints
///
/// Access via the `Amadeus` object
/// ```swift
/// let amadeus = Amadeus(client_id, secret_id)
/// amadeus.referenceData.airLines
/// ```
public class AirLines{
    
    private var client: Client
    
    public init(client:Client) {
        self.client = client
    }
    
    /// Returns the airline name and code.
    ///
    ///   ## Example
    ///   Find to which airlines belongs IATA Code BA
    ///
    ///     amadeus.referenceData.airlines.get(
    ///         airlineCodes:"BA",
    ///         onCompletion: {
    ///             data in ...}
    ///     )
    /// - Parameters:
    ///    - airlineCodes: `String` Code of the airline following IATA standard
    ///
    /// - Returns:
    ///    `JSON` object
    public func get(airlineCodes:String, onCompletion: @escaping (JSON) -> Void){
        client.getAccessToken(onCompletion: {
            (auth) in
            if auth != "error" {
                let body = "?airlineCodes=\(airlineCodes)"
                makeHTTPGetRequestAuth(airLines, auth: auth, body: body, onCompletion: {
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
