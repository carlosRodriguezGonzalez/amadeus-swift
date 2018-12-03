//
//  Hotel.swift
//  Amadeus
//
//  Created by Charly Maxter on 03/12/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation
import SwiftyJSON

fileprivate let flightDates = "v1/shopping/hotel-offers"

/// A namespaced client for the `v1/shopping/hotel-offers` endpoints
///
/// Access via the `Amadeus` object
/// ```swift
/// let amadeus = Amadeus(client_id, secret_id)
/// amadeus.shopping.hotelOffers
/// ```
public class Hotel{
    
    private var client: Client
    private var hotelId: String
    public let hotelOffers: HotelHotelOffers
    
    public init(client:Client, hotelId: String) {
        self.client = client
        self.hotelId = hotelId
        self.hotelOffers = HotelHotelOffers(client: client, hotelId: hotelId)
    }
    
    public func offer(offerId: String) -> Offer {
        return Offer(client: self.client, hotelId: self.hotelId, offerId: offerId)
    }
    
}
