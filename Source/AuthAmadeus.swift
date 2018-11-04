//
//  AuthAmadeus.swift
//  Amadeus
//
//  Created by Charly Maxter on 04/11/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation

public class AuthAmadeus {
    private let grant_type: String
    private var client_id: String
    private var client_secret:String
    fileprivate let urlAuth = "v1/security/oauth2/token"
    
    init(client_id: String, client_secret:String) {
        self.grant_type =  "client_credentials"
        self.client_id = client_id
        self.client_secret = client_secret
    }
    
    public func testAuth(){
        let body = "grant_type=" + grant_type + "&client_id=" + client_id + "&client_secret=" + client_secret
        makeHTTPPostRequest(urlAuth, body: body, onCompletion: { (data, err) in
            print("data:", data)
            if let error = err{
                print(error)
            }
            
        })
    }
    
    func getAuthToken(onCompletion: @escaping (String) -> Void){
        let body = "grant_type=" + grant_type + "&client_id=" + client_id + "&client_secret=" + client_secret
        makeHTTPPostRequest(urlAuth, body: body, onCompletion: { (data, err) in
            
            if let auth = data["access_token"].string{
                onCompletion(auth)
            }else{
                onCompletion("error")
            }
            
            
        })

    }
    
}
