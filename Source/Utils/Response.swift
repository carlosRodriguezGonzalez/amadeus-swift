//
//  Response.swift
//  Amadeus
//
//  Created by Charly Maxter on 19/02/2019.
//  Copyright © 2019 amadeus4dev. All rights reserved.
//

import Foundation
import SwiftyJSON

public class Response{
    
    public var body:JSON
    public var meta:JSON
    public var headers:JSON
    public var data:HTTPURLResponse
    public var responseCode:Int
    
    public init(response:HTTPURLResponse, data:Data?){
        self.responseCode = response.statusCode
        self.data = response
        // HEADERS
        if response.allHeaderFields.count > 0{
            self.headers = JSON.init(response.allHeaderFields)
        }else{
            self.headers = JSON.null
        }
        //
        // BODY
        do{
            if let jsonData = data {
                let json:JSON = try JSON(data: jsonData)
                body = json
            } else {
                body=JSON.null
            }
        }catch let err as NSError{
            print("error:",err)
            body=JSON.null
        }
        //
        // META
        if let meta = body["meta"].array?[0]{
            self.meta = meta
        }else{
            self.meta = JSON.null
        }
        //
        
    }
    
}
