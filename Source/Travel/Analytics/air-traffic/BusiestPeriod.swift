//
//  BusiestPeriod.swift
//  Amadeus
//
//  Created by Charly Maxter on 18/11/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation
import SwiftyJSON

fileprivate let busiestPeriod = "v1/travel/analytics/air-traffic/busiest-period"

public class BusiestPeriod{
    
    private var client: Client
    
    public init(client:Client) {
        self.client = client
    }
    
    public func get(cityCode:String, period:String, direction:String, onCompletion: @escaping (JSON) -> Void){
        client.getAccessToken(onCompletion: {
            (auth) in
            if auth != "error" {
                let body = "?cityCode=\(cityCode)&period=\(period)&direction=\(direction)"
                makeHTTPGetRequestAuth(busiestPeriod, auth: auth, body: body, onCompletion: {
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
