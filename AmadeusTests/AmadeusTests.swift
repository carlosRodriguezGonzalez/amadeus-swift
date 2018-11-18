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
        
        let expectation = XCTestExpectation(description: "TimeOut")
        
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
        
        let expectation = XCTestExpectation(description: "TimeOut")
        
        ama.shopping.flightDestinations.get(origin: "MAD", maxPrice: 10000, onCompletion: {
            data in
            print("DATA ES: ", data)
            XCTAssertNotNil(data)
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 60)
        
    }

    func testFlightDates(){
        let ama = Amadeus(client_id: "VAywvANdPdsxwP6NCA8eKikGdF57QUcF", client_secret: "GCAZRSicTFpR6xbU")
        
        let expectation = XCTestExpectation(description: "TimeOut")
        
        ama.shopping.flightDates.get(origin: "LHR", destination: "PAR", onCompletion: {
            data in
            print("DATA ES: ", data)
            XCTAssertNotNil(data)
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 60)
        
    }
    
    func testHotelOffers(){
        let ama = Amadeus(client_id: "VAywvANdPdsxwP6NCA8eKikGdF57QUcF", client_secret: "GCAZRSicTFpR6xbU")
        
        let expectation = XCTestExpectation(description: "TimeOut")
        
        ama.shopping.hotelOffers.get(cityCode: "PAR", onCompletion: {
            data in
            print("DATA ES: ", data)
            XCTAssertNotNil(data)
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 60)
        
    }

    func testFareSearch(){
        let ama = Amadeus(client_id: "VAywvANdPdsxwP6NCA8eKikGdF57QUcF", client_secret: "GCAZRSicTFpR6xbU")
        
        let expectation = XCTestExpectation(description: "TimeOut")
        
        ama.travel.analytics.fareSearch.get(origin: "NCE", sourceCountry: "FR", period: "2018-11", onCompletion: {
            data in
            print("DATA ES: ", data)
            XCTAssertNotNil(data)
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 60)
        
    }
    
    func testTraveled(){
        let ama = Amadeus(client_id: "VAywvANdPdsxwP6NCA8eKikGdF57QUcF", client_secret: "GCAZRSicTFpR6xbU")
        
        let expectation = XCTestExpectation(description: "TimeOut")
        
        ama.travel.analytics.airTraffic.traveled.get(originCityCode: "MAD", period: "2017-11", onCompletion: {
            data in
            print("DATA ES: ", data)
            XCTAssertNotNil(data)
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 60)
        
    }
    
    func testBooked(){
        let ama = Amadeus(client_id: "VAywvANdPdsxwP6NCA8eKikGdF57QUcF", client_secret: "GCAZRSicTFpR6xbU")
        
        let expectation = XCTestExpectation(description: "TimeOut")
        
        ama.travel.analytics.airTraffic.booked.get(originCityCode: "MAD", period: "2017-11", onCompletion: {
            data in
            print("DATA ES: ", data)
            XCTAssertNotNil(data)
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 60)
        
    }
    
    func testBusiestPeriod(){
        let ama = Amadeus(client_id: "VAywvANdPdsxwP6NCA8eKikGdF57QUcF", client_secret: "GCAZRSicTFpR6xbU")
        
        let expectation = XCTestExpectation(description: "TimeOut")
        
        ama.travel.analytics.airTraffic.busiestPeriod.get(cityCode: "MAD", period: "2017", direction: "ARRIVING", onCompletion: {
            data in
            print("DATA ES: ", data)
            XCTAssertNotNil(data)
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 60)
        
    }
    
    func testAirLines(){
        let ama = Amadeus(client_id: "VAywvANdPdsxwP6NCA8eKikGdF57QUcF", client_secret: "GCAZRSicTFpR6xbU")
        
        let expectation = XCTestExpectation(description: "TimeOut")
        
        ama.referenceData.airLines.get(airlineCodes: "BA", onCompletion: {
            data in
            print("DATA ES: ", data)
            XCTAssertNotNil(data)
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 60)
        
    }
    
    func testCheckinLinks(){
        let ama = Amadeus(client_id: "VAywvANdPdsxwP6NCA8eKikGdF57QUcF", client_secret: "GCAZRSicTFpR6xbU")
        
        let expectation = XCTestExpectation(description: "TimeOut")
        
        ama.referenceData.urls.checkinLinks.get(airlineCode: "BA", onCompletion: {
            data in
            print("DATA ES: ", data)
            XCTAssertNotNil(data)
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 60)
        
    }

}
