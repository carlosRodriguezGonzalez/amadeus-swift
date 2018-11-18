//
//  Airports.swift
//  Amadeus
//
//  Created by Charly Maxter on 18/11/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation
import SwiftyJSON

fileprivate let airports = "v1/reference-data/locations/airports"

public class Airports{
    
    private var client: Client
    
    public init(client:Client) {
        self.client = client
    }
    
    public func get(longitude:Double, latitude:Double, onCompletion: @escaping (JSON) -> Void){
        client.getAccessToken(onCompletion: {
            (auth) in
            if auth != "error" {
                let body = "?longitude=\(longitude)&latitude=\(latitude)"
                makeHTTPGetRequestAuth(airports, auth: auth, body: body, onCompletion: {
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
