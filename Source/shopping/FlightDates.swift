//
//  FlightDates.swift
//  Amadeus
//
//  Created by Charly Maxter on 17/11/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation
import SwiftyJSON

fileprivate let flightDates = "v1/shopping/flight-dates"

public class FlightDates{
    
    private var client: Client
    
    public init(client:Client) {
        self.client = client
    }
    
    public func get(origin:String, destination:String, onCompletion: @escaping (JSON) -> Void){
        client.getAccessToken(onCompletion: {
            (auth) in
            if auth != "error" {
                let body = "?origin=\(origin)&destination=\(destination)"
                makeHTTPGetRequestAuth(flightDates, auth: auth, body: body, onCompletion: {
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
