//
//  ShoppingAmadeus.swift
//  Amadeus
//
//  Created by Charly Maxter on 04/11/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation

public class ShoppingAmadeus {
    
    fileprivate let flightOffers = "v1/shopping/flight-offers"
    
    var auth: AuthAmadeus
    
    public init(auth: AuthAmadeus) {
        self.auth = auth
    }
    
    public func getFlightOffers(){
        auth.getAuthToken(onCompletion: {
            (auth) in
            print("auth:", auth)
        })
    }
    
}
