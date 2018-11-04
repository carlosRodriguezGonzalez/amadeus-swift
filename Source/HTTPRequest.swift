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

public func makeHTTPGetRequestAuth(_ path: String, auth: String, onCompletion: @escaping ServiceResponse) {
    let request = NSMutableURLRequest(url: URL(string: path)!)
    if(auth != ""){
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("jwt \(auth)", forHTTPHeaderField: "Authorization")
    }
    
    let session = URLSession.shared
    
    let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
        //onCompletion(data!, error as NSError?)
    })
    task.resume()
}

public func makeHTTPPostRequest(_ path: String, body: String, onCompletion: @escaping ServiceResponse) {
    
    let request = NSMutableURLRequest(url: URL(string: path)!)
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
