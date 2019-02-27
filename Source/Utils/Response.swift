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
    
    var body:JSON
    var meta:JSON
    var headers:JSON
    var data:HTTPURLResponse
    var responseCode:Int
    
    public init(response:HTTPURLResponse, data:Data?){
        self.responseCode = response.statusCode
        self.data = response
        
        // HEADERS
        if response.allHeaderFields.count > 0{
            self.headers = JSON.init(response.allHeaderFields)
            print("HEADERS: ",self.headers as Any)
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
        print("RESPOSNE CODE:",self.responseCode)
        print("DATARepsonse:",self.meta)
        
    }
    
}
