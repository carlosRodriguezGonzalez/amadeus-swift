//
//  CheckinLinks.swift
//  Amadeus
//
//  Created by Charly Maxter on 18/11/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation
import SwiftyJSON

fileprivate let checkinLinks = "v2/reference-data/urls/checkin-links"

/// A namespaced client for the `v2/reference-data/urls/checkin-links` endpoints
///
/// Access via the `Amadeus` object
/// ```swift
/// let amadeus = Amadeus(client_id, secret_id)
/// amadeus.referenceData.urls.checkinLinks
/// ```
public class CheckinLinks{
    
    private var client: Client
    
    public init(client:Client) {
        self.client = client
    }
    
    /// Returns the checkin links for an airline.
    ///
    ///   ## Example
    ///   Find a the checkin links for Air France
    ///
    ///     amadeus.referenceData.urls.checkinLinks.get(
    ///         airlineCode:"AF",
    ///         onCompletion: {
    ///             data in ...}
    ///     )
    /// - Parameters:
    ///    - airlineCode: `String` Airline ID.
    ///
    /// - Returns:
    ///    `JSON` object
    public func get(data: [String:String], onCompletion: @escaping (JSON) -> Void){
        client.getAccessToken(onCompletion: {
            (auth) in
            if auth != "error" {
                let body = generateGetParameters(data: data)
                makeHTTPGetRequestAuth(checkinLinks, auth: auth, body: body, client: self.client, onCompletion: {
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
