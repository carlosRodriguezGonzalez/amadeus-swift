//
//  AuthAmadeus.swift
//  Amadeus
//
//  Created by Charly Maxter on 04/11/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation
import SwiftyJSON


/// A memorized Access Token, with the ability to auto-refresh when needed.

public class Client {
    fileprivate let urlAuth = "v1/security/oauth2/token"
    private let grant_type: String
    private var client_id: String
    private var client_secret:String
    private var access_token: String
    private var expires_time: Int
    
    
    
    public init(client_id: String, client_secret:String) {
        self.grant_type =  "client_credentials"
        self.client_id = client_id
        self.client_secret = client_secret
        self.expires_time = 0
        self.access_token = ""
    }
    

    ///     this method call to method @needRefresh and if it is true, call to @getAuthToken to take
    ///     the access_token and refresh the token, if not return the access_token.
    ///     And store the access_token.
    ///
    ///      - important: This method use onCompletion.
    ///
    ///      - Returns:
    ///     access_token: the client access token in String format
    public func getAccessToken(onCompletion: @escaping (String) -> Void){
        if needRefresh() {
            //needRefresh()
            getAuthToken(onCompletion: {
                access_token in
                
                onCompletion(access_token)
            })
            
        }else{
            onCompletion(access_token)
        }
    }
    

    ///Checks if this access token needs a refresh.
    private func needRefresh() -> Bool{
        if access_token == "" || access_token == "error" || Int(Date().timeIntervalSince1970 * 1000) > expires_time {
            return true
        }else{
            return false
        }
    }
    
    
    ///Fetches a new Access Token using the credentials from the client.
    private func getAuthToken(onCompletion: @escaping (String) -> Void){
        let body = "grant_type=" + grant_type + "&client_id=" + client_id + "&client_secret=" + client_secret
        makeHTTPPostRequest(urlAuth, body: body, onCompletion: { (data, err) in
            print("auth:", data)
            if let error = data["error"].string{
                onCompletion(error)
            }else{
                if let auth = data["access_token"].string{
                    onCompletion(auth)
                }else{
                    onCompletion("error")
                }
            }
            self.storeData(data: data)
            
        })
        
    }
    

    ///Store the fetched access token and expiry date.
    private func storeData(data: JSON){
        if let access_token = data["access_token"].string{
            self.access_token = access_token
        }else{
            self.access_token = "error"
        }
        
        if let expires_time = data["expires_in"].int{
            self.expires_time = expires_time * 1000 + Int(Date().timeIntervalSince1970 * 1000)
        }else{
            self.expires_time = 0
        }
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
    
}
