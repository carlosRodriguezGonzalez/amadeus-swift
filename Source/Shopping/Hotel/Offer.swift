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

/// A namespaced client for the `v1/shopping/hotel-offers` endpoints
///
/// Access via the `Amadeus` object
/// ```swift
/// let amadeus = Amadeus(client_id, secret_id)
/// amadeus.shopping.hotelOffers
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
    
    /// Find the list of hotels for a dedicated city.
    ///
    ///   ## Example
    ///   Search for hotels in Paris
    ///
    ///     amadeus.shopping.hotelOffers.get(
    ///         cityCode:"PAR",
    ///         onCompletion: {
    ///             data in ...}
    ///     )
    /// - Parameters:
    ///    - origin: `String` City IATA code.
    ///
    /// - Returns:
    ///    `JSON` object
    public func get(data: [String:String], onCompletion: @escaping (JSON) -> Void){
        client.getAccessToken(onCompletion: {
            (auth) in
            if auth != "error" {
                let body = generateGetParameters(data: data)
                let base = "/v1/shopping/hotels/\(self.hotelId)/offers/\(self.offerId)"
                makeHTTPGetRequestAuth(base, auth: auth, body: body, onCompletion: {
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
