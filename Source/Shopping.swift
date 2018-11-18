//
//  ShoppingAmadeus.swift
//  Amadeus
//
//  Created by Charly Maxter on 04/11/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation

/// A namespaced client for the `v1/shopping` endpoints
///
/// Access via the `Amadeus` object
/// ```swift
/// let amadeus = Amadeus(client_id, secret_id)
/// amadeus.shopping
/// ```
public class Shopping {
    
    public let flightOffers:FlightOffers
    public let flightDestinations:FlightDestinations
    public let flightDates:FlightDates
    public let hotelOffers:HotelOffers
    
    public init(client: Client) {
        flightOffers = FlightOffers(client: client)
        flightDestinations = FlightDestinations(client: client)
        flightDates = FlightDates(client: client)
        hotelOffers = HotelOffers(client: client)
    }
    
    
    
}
