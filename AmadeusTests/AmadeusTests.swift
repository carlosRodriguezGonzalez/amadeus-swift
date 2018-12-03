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
        
        ama.shopping.flightOffers.get(data: ["origin": "MAD", "destination": "LUX", "departureDate": "2018-12-10"], onCompletion: {
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
        
        ama.shopping.flightDestinations.get(data: ["origin": "MAD", "maxPrice": "10000"], onCompletion: {
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
        
        ama.shopping.flightDates.get(data:["origin": "LHR", "destination": "PAR"], onCompletion: {
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
        
        ama.shopping.hotelOffers.get(data:["cityCode": "PAR"], onCompletion: {
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
        
        ama.travel.analytics.fareSearch.get(data:["origin": "NCE", "sourceCountry": "FR", "period": "2018-11"], onCompletion: {
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
        
        ama.travel.analytics.airTraffic.traveled.get(data:["originCityCode": "MAD", "period": "2017-11"], onCompletion: {
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
        
        ama.travel.analytics.airTraffic.booked.get(data:["originCityCode": "MAD", "period": "2017-11"], onCompletion: {
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
        
        ama.travel.analytics.airTraffic.busiestPeriod.get(data:["cityCode": "MAD", "period": "2017", "direction": "ARRIVING"], onCompletion: {
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
        
        ama.referenceData.airLines.get(data:["airlineCodes": "BA"], onCompletion: {
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
        
        ama.referenceData.urls.checkinLinks.get(data:["airlineCode": "BA"], onCompletion: {
            data in
            print("DATA ES: ", data)
            XCTAssertNotNil(data)
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 60)
        
    }
    
    func testLocations(){
        let ama = Amadeus(client_id: "VAywvANdPdsxwP6NCA8eKikGdF57QUcF", client_secret: "GCAZRSicTFpR6xbU")
        
        let expectation = XCTestExpectation(description: "TimeOut")
        
        ama.referenceData.locations.get(data:["subType": "AIRPORT,CITY", "keyword": "lon"], onCompletion: {
            data in
            print("DATA ES: ", data)
            XCTAssertNotNil(data)
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 60)
        
    }
    
    func testAirports(){
        let ama = Amadeus(client_id: "VAywvANdPdsxwP6NCA8eKikGdF57QUcF", client_secret: "GCAZRSicTFpR6xbU")
        
        let expectation = XCTestExpectation(description: "TimeOut")
        
        ama.referenceData.locations.airports.get(data:["longitude": "49.0000", "latitude": "2.55"], onCompletion: {
            data in
            print("DATA ES: ", data)
            XCTAssertNotNil(data)
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 60)
        
    }
    
    
    func testSearchByDestination(){
        let ama = Amadeus(client_id: "VAywvANdPdsxwP6NCA8eKikGdF57QUcF", client_secret: "GCAZRSicTFpR6xbU")
        
        let expectation = XCTestExpectation(description: "TimeOut")
        
        ama.travel.analytics.airTraffic.searchedByDestination.get(data:["originCityCode":"MAD", "destinationCityCode":"NYC", "marketCountryCode": "ES", "searchPeriod": "2017-08"], onCompletion: {
            data in
            print("DATA ES: ", data)
            XCTAssertNotNil(data)
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 60)
        
    }

}
