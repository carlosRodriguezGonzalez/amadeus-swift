//
//  Amadeus.swift
//  Amadeus
//
//  Created by Charly Maxter on 04/11/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation

public class Amadeus {
    
    public let auth:AuthAmadeus
    public let shopping:ShoppingAmadeus
    
    public init(client_id: String, client_secret:String) {
        auth = AuthAmadeus(client_id: client_id, client_secret: client_secret)
        shopping = ShoppingAmadeus(auth: auth)
    }
    
    
    
}
