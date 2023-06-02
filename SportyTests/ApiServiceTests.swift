//
//  ApiServiceTests.swift
//  SportyTests
//
//  Created by Menna Ihab on 01/06/2023.
//

import XCTest
@testable import Sporty

final class ApiServiceTests: XCTestCase {
    
    let apiService : ApiServiceProtocol = ApiService()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
//    func testGetLeaguesFromApi(){
//           let expectation = expectation(description: "data coming from api")
//        apiService.getLeaguesFromApi(compilationHandler: { response, error in
//            guard let response = response else{
//                XCTFail()
//                expectation.fulfill()
//                return
//            }
//            XCTAssertGreaterThan(response.count, 0, "no data")
//              expectation.fulfill()
//        }, type: FootballLeagues.self)
//
//           waitForExpectations(timeout: 5, handler: nil)
//       }
    
    func testGetLeaguesFromApi(){
           let expectation = expectation(description: "data coming from api")
        apiService.getLeaguesFromApi(compilationHandler: { response, error in
            guard let response = response else{
                XCTFail()
                expectation.fulfill()
                return
            }
            XCTAssertGreaterThan(response.count, 0, "no data")
              expectation.fulfill()
        }, type: FootballLeagues.self)
            
           waitForExpectations(timeout: 5, handler: nil)
       }
   
    func testGetLatestEventsFromApi(){
           let expectation = expectation(description: "data coming from api")
        apiService.getLatestEventsFromApi(compilationHandler:  { response, error in
            guard let response = response else{
                XCTFail()
                expectation.fulfill()
                return
            }
            XCTAssertGreaterThan(response.count, 0, "no data")
              expectation.fulfill()
        }, type: FootballEvent.self,leagId:4)
            
           waitForExpectations(timeout: 5, handler: nil)
       }
    
    func testGetUpComingEventsFromApi(){
           let expectation = expectation(description: "data coming from api")
        apiService.getUpComingEventsFromApi(compilationHandler:  { response, error in
            guard let response = response else{
                XCTFail()
                expectation.fulfill()
                return
            }
            XCTAssertGreaterThan(response.count, 0, "no data")
              expectation.fulfill()
        }, type: FootballEvent.self,leagId:4)
            
           waitForExpectations(timeout: 5, handler: nil)
       }
    
    func testGetTeamsFromApi(){
           let expectation = expectation(description: "data coming from api")
        apiService.getTeamsFromApi(compilationHandler:  { response, error in
            guard let response = response else{
                XCTFail()
                expectation.fulfill()
                return
            }
            XCTAssertGreaterThan(response.count, 0, "no data")
              expectation.fulfill()
        }, type: FootballTeam.self,leagId:5)
            
           waitForExpectations(timeout: 5, handler: nil)
       }
    
    func getTeamDetailsFromApi(){
           let expectation = expectation(description: "data coming from api")
        apiService.getTeamDetailsFromApi(compilationHandler:  { response, error in
            guard let response = response else{
                XCTFail()
                expectation.fulfill()
                return
            }
            XCTAssertGreaterThan(response.count, 0, "no data")
              expectation.fulfill()
        }, type: FootballTeam.self,teamId:5)
            
           waitForExpectations(timeout: 5, handler: nil)
       }
    func testGetTeamDetailsFromApi(){
           let expectation = expectation(description: "data coming from api")
        apiService.getTeamDetailsFromApi(compilationHandler:  { response, error in
            guard let response = response else{
                XCTFail()
                expectation.fulfill()
                return
            }
            XCTAssertGreaterThan(response.count, 0, "no data")
              expectation.fulfill()
        }, type: BasketballTeam.self,teamId:5)
            
           waitForExpectations(timeout: 5, handler: nil)
       }



    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
