//
//  HTTPRequest.swift
//  Amadeus
//
//  Created by Charly Maxter on 04/11/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation
import SwiftyJSON

public typealias ServiceResponse = (JSON, NSError?) -> Void

public func makeHTTPGetRequestAuth(_ path: String, auth: String, body: String, client:Client, onCompletion: @escaping ServiceResponse) {
    var url:String = ""
    
    if client.ssl {
        url += "https://"
    }else{
        url += "http://"
    }
    url += client.host + path + body
    print("URLf:", url)

    let request = NSMutableURLRequest(url: URL(string: url)!)
    //request.httpBody = body.data(using: String.Encoding.utf8);
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("Bearer \(auth)", forHTTPHeaderField: "Authorization")
    
    let session = URLSession.shared
    let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
        
        do{
            if let jsonData = data {
                let json:JSON = try JSON(data: jsonData)
                onCompletion(json, nil)
            } else {
                onCompletion(JSON.null, error as NSError?)
            }
        }catch let err as NSError{
            print("error:",err)
        }
        
    })
    task.resume()
}

public func makeHTTPPostRequest(_ path: String, body: String, ssl:Bool, host:String, onCompletion: @escaping ServiceResponse) {
    var url:String = ""
    
    if ssl {
        url += "https://"
    }else{
        url += "http://"
    }
    url += host + path
    print("URL:", url)
    let request = NSMutableURLRequest(url: URL(string: url)!)
    request.httpMethod = "POST"
    request.httpBody = body.data(using: String.Encoding.utf8);
    
    request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
    
    let session = URLSession.shared
    let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
        
        do{
            if let jsonData = data {
                let json:JSON = try JSON(data: jsonData)
                onCompletion(json, nil)
            } else {
                onCompletion(JSON.null, error as NSError?)
            }
        }catch let err as NSError{
            print("error:",err)
        }
        
    })
    task.resume()
}

public func generateGetParameters(data: [String:String]) -> String{
    var res = ""
    var firstTime = true
    for item in data {
        if firstTime {
            firstTime = false
            res += "?\(item.key)=\(item.value)"
        }else{
            res += "&\(item.key)=\(item.value)"
        }
    }
    return res
}
