//
//  AirTraffic.swift
//  Amadeus
//
//  Created by Charly Maxter on 18/11/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation

public class AirTraffic{
    
    public let traveled:Traveled
    public let booked:Booked
    
    public init(client:Client){
        traveled = Traveled(client: client)
        booked = Booked(client: client)
    }
}
