//
//  MockApiServiceTests.swift
//  SportyTests
//
//  Created by Menna Ihab on 02/06/2023.
//

import XCTest
@testable import Sporty

final class MockApiServiceTests: XCTestCase {
    
    var apiService : ApiServiceProtocol?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetLeaguesFromApiShouldPass(){
        apiService = MockApiService(shouldReturnError: false)
        apiService?.getLeaguesFromApi(compilationHandler: { response, error in
            guard let response = response else{
                XCTFail()
                return
            }
            XCTAssertEqual(response.count, 2, "API Faild")
        },type: FootballLeagues.self)
    }
    
    
    
    
        func testGetLeaguesFromApiShouldFail(){
            apiService = MockApiService(shouldReturnError: true)
            apiService?.getLeaguesFromApi(compilationHandler: { response, error in
                XCTAssertNil(response, "Items Not nil")
            },type: FootballLeagues.self)
           
                
            }
    
    func testGetLatestEventsFromApiShouldPass(){
        apiService = MockApiService(shouldReturnError: false)
        apiService?.getLatestEventsFromApi(compilationHandler: { response, error in
            guard let response = response else{
                XCTFail()
                return
            }
            XCTAssertEqual(response.count, 2, "API Faild")
        },type: FootballEvent.self,leagId:4)
    }
    
    
    
    
        func testGetLatestEventsFromApiShouldFail(){
            apiService = MockApiService(shouldReturnError: true)
            apiService?.getLatestEventsFromApi(compilationHandler: { response, error in
                XCTAssertNil(response, "Items Not nil")
            },type: FootballEvent.self,leagId: 4)
           
                
            }
    
    
    func testGetUpComingEventsFromApiShouldPass(){
        apiService = MockApiService(shouldReturnError: false)
        apiService?.getUpComingEventsFromApi(compilationHandler: { response, error in
            guard let response = response else{
                XCTFail()
                return
            }
            XCTAssertEqual(response.count, 2, "API Faild")
        },type: FootballEvent.self,leagId:4)
    }
    
    
    
    
        func testGetUpComingEventsFromApiShouldFail(){
            apiService = MockApiService(shouldReturnError: true)
            apiService?.getUpComingEventsFromApi(compilationHandler: { response, error in
                XCTAssertNil(response, "Items Not nil")
            },type: FootballEvent.self,leagId: 4)
           
                
            }
      
    func testGetTeamsFromApiShouldPass(){
        apiService = MockApiService(shouldReturnError: false)
        apiService?.getTeamsFromApi(compilationHandler: { response, error in
            guard let response = response else{
                XCTFail()
                return
            }
            XCTAssertEqual(response.count, 4, "API Faild")
        },type: BasketballTeam.self,leagId:766)
    }
    
    
    
    
        func testGetTeamsFromApiShouldFail(){
            apiService = MockApiService(shouldReturnError: true)
            apiService?.getTeamsFromApi(compilationHandler: { response, error in
                XCTAssertNil(response, "Items Not nil")
            },type: FootballTeam.self,leagId: 4)
           
                
            }
 
      func testGetTeamDetailsFromApiShouldPass(){
        apiService = MockApiService(shouldReturnError: false)
        apiService?.getTeamDetailsFromApi(compilationHandler: { response, error in
            guard let response = response else{
                XCTFail()
                return
            }
            XCTAssertEqual(response.count, 1, "API Faild")
        },type: BasketballTeam.self,teamId:4)
    }
    
    
    
    
        func testGetTeamDetailsFromApiShouldFail(){
            apiService = MockApiService(shouldReturnError: true)
            apiService?.getTeamDetailsFromApi(compilationHandler: { response, error in
                XCTAssertNil(response, "Items Not nil")
            },type: FootballTeam.self,teamId: 4)
           
                
            }
      
      
    
    

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
