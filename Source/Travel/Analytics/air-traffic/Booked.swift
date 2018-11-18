//
//  Booked.swift
//  Amadeus
//
//  Created by Charly Maxter on 18/11/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation
import SwiftyJSON

fileprivate let booked = "v1/travel/analytics/air-traffic/traveled"

public class Booked{
    
    private var client: Client
    
    public init(client:Client) {
        self.client = client
    }
    
    public func get(originCityCode:String, period:String, onCompletion: @escaping (JSON) -> Void){
        client.getAccessToken(onCompletion: {
            (auth) in
            if auth != "error" {
                let body = "?originCityCode=\(originCityCode)&period=\(period)"
                makeHTTPGetRequestAuth(booked, auth: auth, body: body, onCompletion: {
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
