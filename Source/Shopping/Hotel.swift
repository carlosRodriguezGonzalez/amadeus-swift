//
//  Hotel.swift
//  Amadeus
//
//  Created by Charly Maxter on 03/12/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation
import SwiftyJSON

fileprivate let flightDates = "/v1/shopping/hotels/:hotel_id"

/// A namespaced client for the `/v1/shopping/hotels/:hotel_id` endpoints
///
/// Access via the `Amadeus` object
/// ```swift
/// let amadeus = Amadeus(client_id, secret_id)
/// amadeus.shopping.hotel(123)
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
    
    /// Loads a namespaced path for a specific hotel offer with a specific hotel ID and offer ID.
    ///
    ///   ## Example
    ///
    ///     ama.shopping.hotel(hotelId: "E5C6F41E18EDA2E60884A593B4F5BC17625044FC42DA6F2AA25172C4327FC565").offer(offerId: "1234").get(
    ///     data:[:],
    ///     onCompletion: {
    ///             data in ...
    ///     })
    /// - Parameters:
    ///    - offerId: `String` The ID of the hotel to search for
    ///
    /// - Returns:
    ///    Offer object
    public func offer(offerId: String) -> Offer {
        return Offer(client: self.client, hotelId: self.hotelId, offerId: offerId)
    }
    
}
