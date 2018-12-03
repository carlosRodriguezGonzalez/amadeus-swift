//
//  AirTraffic.swift
//  Amadeus
//
//  Created by Charly Maxter on 18/11/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation

/// A namespaced client for the `v1/travel/analytics/air-traffic` endpoints
///
/// Access via the `Amadeus` object
/// ```
/// let amadeus = Amadeus(client_id, client_secret)
/// amadeus.travel.analytics.airTraffic
/// ```
public class AirTraffic{
    
    public let traveled:Traveled
    public let booked:Booked
    public let busiestPeriod:BusiestPeriod
    public let searchedByDestination:SearchedByDestination
    public let searched:Searched
    
    public init(client:Client){
        traveled = Traveled(client: client)
        booked = Booked(client: client)
        busiestPeriod = BusiestPeriod(client: client)
        searchedByDestination = SearchedByDestination(client: client)
        searched = Searched(client: client)
    }
}
