//
//  FlightOffers.swift
//  Amadeus
//
//  Created by Charly Maxter on 04/11/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import Foundation
import SwiftyJSON

fileprivate let flightOffers = "v1/shopping/flight-offers"

/// A namespaced client for the `v1/shopping/flight-offers` endpoints
///
/// Access via the `Amadeus` object
/// ```swift
/// let amadeus = Amadeus(client_id, secret_id)
/// amadeus.shopping.flightOffers
/// ```
public class FlightOffers{
    
    private var client: Client
    
    public init(client:Client) {
        self.client = client
    }
    
    /// Find the cheapest bookable flights for a date.
    ///
    ///   ## Example
    ///   Find the cheapest flights from New-York to Madrid for Summer 2019
    ///
    ///     amadeus.shopping.flightOffers.get(
    ///         origin:"NYC",
    ///         destination:"MAD",
    ///         departureDate:"2018-08-01",
    ///         onCompletion: {
    ///             data in ...}
    ///     )
    ///
    /// - Parameters:
    ///     - origin: `String` City/Airport IATA code from which the flight will depart.
    ///     - destination: `String` City/Airport IATA code to which traveler is going.
    ///     - departureDate: `String` The departure date for the flight.
    ///
    /// - Returns:
    ///    `JSON` object
    ///
    public func get(origin:String, destination:String, departureDate:String, onCompletion: @escaping (JSON) -> Void){
        client.getAccessToken(onCompletion: {
            (auth) in
            if auth != "error" {
                let body = "?origin=\(origin)&destination=\(destination)&departureDate=\(departureDate)"
                makeHTTPGetRequestAuth(flightOffers, auth: auth, body: body, onCompletion: {
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
