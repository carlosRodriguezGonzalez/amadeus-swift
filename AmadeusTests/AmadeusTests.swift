//
//  AmadeusTests.swift
//  AmadeusTests
//
//  Created by Charly Maxter on 04/11/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import XCTest
import Amadeus
class AmadeusTests: XCTestCase {
    func testFlightOffers(){
        let ama = Amadeus(client_id: "VAywvANdPdsxwP6NCA8eKikGdF57QUcF", client_secret: "GCAZRSicTFpR6xbU")
        
        let expectation = XCTestExpectation(description: "HOLA")
        
        ama.shopping.flightOffers.get(origin: "MAD", destination: "LUX", departureDate: "2018-12-10", onCompletion: {
            data in
            print("DATA ES: ", data)
            XCTAssertNotNil(data)
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 60)
        
    }
    func testFlightDestinations(){
        let ama = Amadeus(client_id: "VAywvANdPdsxwP6NCA8eKikGdF57QUcF", client_secret: "GCAZRSicTFpR6xbU")
        
        let expectation = XCTestExpectation(description: "HOLA")
        
        ama.shopping.flightOffers.get(origin: "MAD", destination: "LUX", departureDate: "2018-12-10", onCompletion: {
            data in
            print("DATA ES: ", data)
            XCTAssertNotNil(data)
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 60)
        
    }

}
