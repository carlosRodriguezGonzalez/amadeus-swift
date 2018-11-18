//
//  CheckinLinks.swift
//  Amadeus
//
//  Created by Charly Maxter on 18/11/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation
import SwiftyJSON

fileprivate let checkinLinks = "v2/reference-data/urls/checkin-links"

public class CheckinLinks{
    
    private var client: Client
    
    public init(client:Client) {
        self.client = client
    }
    
    public func get(airlineCode:String, onCompletion: @escaping (JSON) -> Void){
        client.getAccessToken(onCompletion: {
            (auth) in
            if auth != "error" {
                let body = "?airlineCode=\(airlineCode)"
                makeHTTPGetRequestAuth(checkinLinks, auth: auth, body: body, onCompletion: {
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
