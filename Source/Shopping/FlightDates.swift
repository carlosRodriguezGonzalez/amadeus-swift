//
//  FlightDates.swift
//  Amadeus
//
//  Created by Charly Maxter on 17/11/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation
import SwiftyJSON

fileprivate let flightDates = "v1/shopping/flight-dates"

/// A namespaced client for the `v1/shopping/flight-dates` endpoints
///
/// Access via the `Amadeus` object
/// ```swift
/// let amadeus = Amadeus(client_id, secret_id)
/// amadeus.shopping.flightDates
/// ```
public class FlightDates{
    
    private var client: Client
    
    public init(client:Client) {
        self.client = client
    }
    
    /// Find the cheapest destinations where you can fly to.
    ///
    ///   ## Example
    ///   Find the cheapest flight dates from New-York to Madrid
    ///
    ///     amadeus.shopping.flightDates.get(
    ///         origin:"NYC",
    ///         destination: "MAD",
    ///         onCompletion: {
    ///             data in ...}
    ///     )
    /// - Parameters:
    ///    - origin: `String` City/Airport IATA code from which the flight will depart.
    ///    - destination: `String` City/Airport IATA code to which traveler is going.
    ///
    /// - Returns:
    ///    `JSON` object
    public func get(data: [String:String], onCompletion: @escaping AmadeusResponse){
        client.getAccessToken(onCompletion: {
            (auth) in
            if auth != "error" {
                let path = self.generateURLFlightDates(data: data)
                getRequest(path: path, auth: auth, client: self.client, onCompletion: {
                    data,err  in
                    if let error = err {
                        onCompletion(nil,error)
                    }else{
                        onCompletion(data,nil)
                    }
                })
            }else{
                onCompletion(nil,nil)
            }
        })
    }
    
    private func generateURLFlightDates(data:[String:String]) -> String{
        return generateURL(client: self.client, path: flightDates, data: data)
    }
    
}
