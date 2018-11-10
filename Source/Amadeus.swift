//
//  Amadeus.swift
//  Amadeus
//
//  Created by Charly Maxter on 04/11/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation

public class Amadeus {
    
    public let client:Client
    public let shopping:Shopping
    
    public init(client_id: String, client_secret:String) {
        client = Client(client_id: client_id, client_secret: client_secret)
        shopping = Shopping(client: client)
    }
    
    
    
}
