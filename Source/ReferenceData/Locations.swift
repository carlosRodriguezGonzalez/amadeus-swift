//
//  Locations.swift
//  Amadeus
//
//  Created by Charly Maxter on 18/11/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation
import SwiftyJSON

fileprivate let locations = "v1/reference-data/locations"

public class Locations{
    
    private let client: Client
    public let airports:Airports
    
    public init(client:Client) {
        self.client = client
        airports = Airports(client: client)
    }
    
    public func get(subType:String, keyword:String, onCompletion: @escaping (JSON) -> Void){
        client.getAccessToken(onCompletion: {
            (auth) in
            if auth != "error" {
                let body = "?subType=\(subType)&keyword=\(keyword)"
                makeHTTPGetRequestAuth(locations, auth: auth, body: body, onCompletion: {
                    data,err  in
                    if let error = err {
                        onCompletion(JSON(parseJSON: "{error:\(error)}"))
                    }else{
                        onCompletion(data)
                    }
                })
            }else{
                onCompletion("error")
            }
        })
    }
}
