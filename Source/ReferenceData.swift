//
//  ReferenceData.swift
//  Amadeus
//
//  Created by Charly Maxter on 18/11/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation

public class ReferenceData{
    
    public let airLines:AirLines
    public let urls:Urls
    public let locations:Locations
    
    public init(client:Client){
        airLines = AirLines(client: client)
        urls = Urls(client: client)
        locations = Locations(client: client)
    }
}
