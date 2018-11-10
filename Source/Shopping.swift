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
    
    public init(client: Client) {
        flightOffers = FlightOffers(client: client)
    }
    
    
    
}
