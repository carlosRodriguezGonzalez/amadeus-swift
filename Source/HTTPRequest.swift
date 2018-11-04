//
//  HTTPRequest.swift
//  Amadeus
//
//  Created by Charly Maxter on 04/11/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation

public typealias ServiceResponse = (Data, NSError?) -> Void

public func makeHTTPGetRequestAuth(_ path: String, auth: String, onCompletion: @escaping ServiceResponse) {
    let request = NSMutableURLRequest(url: URL(string: path)!)
    if(auth != ""){
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("jwt \(auth)", forHTTPHeaderField: "Authorization")
    }
    
    let session = URLSession.shared
    
    let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
        onCompletion(data!, error as NSError?)
    })
    task.resume()
}
