//
//  Amadeus.swift
//  Amadeus
//
//  Created by Charly Maxter on 04/11/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation

/// A namespaced amadeus
public class Amadeus {
    
    public let client:Client
    public let shopping:Shopping
    public let travel:Travel
    public let referenceData:ReferenceData
    
    
    
    public init(client_id: String, client_secret:String, ssl:Bool, host:String) {
        client = Client(client_id: client_id, client_secret: client_secret, ssl:ssl, host:host)
        shopping = Shopping(client: client)
        travel = Travel(client: client)
        referenceData = ReferenceData(client: client)
    }
    
    public convenience init(){
        self.init(client_id: "", client_secret: "", ssl: false, host:"test.api.amadeus.com")
    }
    
    public convenience init(client_id: String, client_secret:String){
        self.init(client_id:client_id, client_secret:client_secret, ssl:false, host:"test.api.amadeus.com")
    }
    
}
