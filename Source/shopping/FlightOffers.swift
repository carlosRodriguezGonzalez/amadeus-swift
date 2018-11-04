//
//  FlightOffers.swift
//  Amadeus
//
//  Created by Charly Maxter on 04/11/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation

fileprivate let flightOffers = "v1/shopping/flight-offers"

public class FlightOffers{
    
    private var auth: AuthAmadeus
    
    public init(auth:AuthAmadeus) {
        self.auth = auth
    }
    
    public func getFlightOffers(onCompletion: @escaping (String) -> Void){
        auth.getAuthToken(onCompletion: {
            (auth) in
            if auth != "error" {
                
            }else{
                onCompletion("error")
            }
        })
    }
    
    
}
