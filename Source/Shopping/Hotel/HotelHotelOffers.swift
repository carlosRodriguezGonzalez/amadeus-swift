//
//  HotelOffers.swift
//  Amadeus
//
//  Created by Charly Maxter on 03/12/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation
import SwiftyJSON

fileprivate let hotelHotelOffers = "v1/shopping/hotels/${this.hotelId}/hotel-offers"

/// A namespaced client for the `v1/shopping/hotels/${this.hotelId}/hotel-offers` endpoints
///
/// Access via the `Amadeus` object
/// ```swift
/// let amadeus = Amadeus(client_id, secret_id)
/// amadeus.shopping.hotelHotelOffers
/// ```
public class HotelHotelOffers{
    
    private var client: Client
    private var hotelId: String
    
    public init(client:Client, hotelId: String) {
        self.client = client
        self.hotelId = hotelId
    }
    
    /// Loads a namespaced path for a specific hotel offer with a specific hotel ID and offer ID.
    ///
    ///   ## Example
    ///     Search for hotels in Paris
    ///
    ///     ama.shopping.hotel(hotelId: "E5C6F41E18EDA2E60884A593B4F5BC17625044FC42DA6F2AA25172C4327FC565").hotelOffers.get(
    ///     data:["cityCode":"PAR"],
    ///     onCompletion: {
    ///             data in ...
    ///     })
    /// - Parameters:
    ///    - cityCode: `String` City IATA code
    ///    - latitude: `Double` atitude of geographic location to search around. Example: 52.5238
    ///    - longitude: `Double` Longitude of geographic location to search around. Example: 13.3835
    ///    - hotels: `String` Comma separated list of Amadeus hotel codes to request. Example: RTPAR001
    ///
    /// - Returns:
    ///    JSON object
    public func get(data: [String:String], onCompletion: @escaping (JSON) -> Void){
        client.getAccessToken(onCompletion: {
            (auth) in
            if auth != "error" {
                let body = generateGetParameters(data: data)
                let base = "v1/shopping/hotels/\(self.hotelId)/hotel-offers"
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
