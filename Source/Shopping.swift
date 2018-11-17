//
//  ShoppingAmadeus.swift
//  Amadeus
//
//  Created by Charly Maxter on 04/11/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation

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
