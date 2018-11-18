//
//  Urls.swift
//  Amadeus
//
//  Created by Charly Maxter on 18/11/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation

/// A namespaced client for the `v2/reference-data/urls` endpoints
///
/// Access via the `Amadeus` object
/// ```swift
/// let amadeus = Amadeus(client_id, secret_id)
/// amadeus.referenceData.urls
/// ```
public class Urls{
    
    public let checkinLinks:CheckinLinks
    
    public init(client:Client){
        checkinLinks = CheckinLinks(client:client)
    }
}
