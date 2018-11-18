//
//  Urls.swift
//  Amadeus
//
//  Created by Charly Maxter on 18/11/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation

public class Urls{
    
    public let checkinLinks:CheckinLinks
    
    public init(client:Client){
        checkinLinks = CheckinLinks(client:client)
    }
}
