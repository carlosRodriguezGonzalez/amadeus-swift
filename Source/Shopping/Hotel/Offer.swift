//
//  Offer.swift
//  Amadeus
//
//  Created by Charly Maxter on 03/12/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation
import SwiftyJSON

fileprivate let offer = "/v1/shopping/hotels/${this.hotelId}/offers/${this.offerId}"

/// A namespaced client for the `/v1/shopping/hotels/${this.hotelId}/offers/${this.offerId}` endpoints
///
/// Access via the `Amadeus` object
/// ```swift
/// let amadeus = Amadeus(client_id, secret_id)
/// amadeus.shopping.hotel(123).offer(234)
/// ```
public class Offer{
    
    private var client: Client
    private var hotelId: String
    private var offerId: String
    
    
    public init(client:Client, hotelId: String, offerId: String) {
        self.client = client
        self.hotelId = hotelId
        self.offerId = offerId
    }
    
    /// Get room and rate details
    ///
    ///   ## Example
    ///   Search for hotel offers for hotel with ID 123
    ///
    ///     ama.shopping.hotel(hotelId: "E5C6F41E18EDA2E60884A593B4F5BC17625044FC42DA6F2AA25172C4327FC565").offer(offerId: "1234").get()
    /// - Parameters:
    ///    - offerId: `String` The ID of the hotel to search
    ///
    /// - Returns:
    ///    `JSON` object
    /*
    public func get(data: [String:String], onCompletion: @escaping (JSON) -> Void){
        client.getAccessToken(onCompletion: {
            (auth) in
            if auth != "error" {
                let body = generateGetParameters(data: data)
                let base = "/v1/shopping/hotels/\(self.hotelId)/offers/\(self.offerId)"
                makeHTTPGetRequestAuth(base, auth: auth, body: body, client: self.client, onCompletion: {
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
    }*/
    
}
