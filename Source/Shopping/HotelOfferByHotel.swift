//
//  HotelOfferByHotel.swift
//  Amadeus
//
//  Created by Charly Maxter on 16/03/2019.
//  Copyright © 2019 amadeus4dev. All rights reserved.
//

import Foundation
import SwiftyJSON

fileprivate let hotelOfferByHotel = "v2/shopping/hotel-offers/by-hotel"

/// A namespaced client for the `v1/shopping/hotel-offers` endpoints
///
/// Access via the `Amadeus` object
/// ```swift
/// let amadeus = Amadeus(client_id, secret_id)
/// amadeus.shopping.hotelOffers
/// ```
public class HotelOfferByHotel{
    
    private var client: Client
    
    public init(client:Client) {
        self.client = client
    }
    
    
    public func get(data: [String:String], onCompletion: @escaping AmadeusResponse){
        client.getAccessToken(onCompletion: {
            (auth) in
            if auth != "error" {
                let path = self.generateURLHotelOffers(data: data)
                getRequest(path: path, auth: auth, client: self.client, onCompletion: {
                    data,err  in
                    if let error = err {
                        onCompletion(nil,error)
                    }else{
                        onCompletion(data,nil)
                    }
                })
            }else{
                onCompletion(nil,nil)
            }
        })
    }
    
    private func generateURLHotelOffers(data:[String:String]) -> String{
        
        return generateURL(client: self.client, path: hotelOfferByHotel, data: data)
    }
    
}
