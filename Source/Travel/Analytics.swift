//
//  Analytics.swift
//  Amadeus
//
//  Created by Charly Maxter on 18/11/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation

public class Analytics{
    
    public let fareSearch:FareSearch
    
    public init(client:Client){
        fareSearch = FareSearch(client: client)
    }
}
