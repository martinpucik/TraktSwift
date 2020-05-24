//
//  TraktSwiftTests.swift
//  TraktSwift
//
//  Created by Martin Púčik on 02/05/2020.
//

import Foundation
import XCTest
@testable import TraktSwift

final class TraktSwiftTests: XCTestCase {
    static var allTests = [
        ("testTrendingMovies", testTrendingMovies),
        ("testPopularMovies", testPopularMovies),
    ]
    
    override class func setUp() {
        super.setUp()
        Defaults.clientID = ProcessInfo.processInfo.environment["TESTS_TRAKT_STAGING_CLIENT_ID"] ?? ""
        Defaults.clientSecret = ProcessInfo.processInfo.environment["TESTS_TRAKT_STAGING_CLIENT_SECRET"] ?? ""
    }
    
    func testTrendingMovies() {
        let expectation = XCTestExpectation()
        Trakt.trendingMovies(completion: { result in
            switch result {
                case .success(let response):
                    XCTAssertTrue(response.trendingMovies.isEmpty)
                case .failure(let error):
                    XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 5)
    }

    func testPopularMovies() {
        let expectation = XCTestExpectation()
        Trakt.popularMovies(completion: { result in
            switch result {
                case .success(let response):
                    XCTAssertFalse(response.movies.isEmpty)
                case .failure(let error):
                    XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 5)
    }

    func testMostPlayerMovies() {
        let expectation = XCTestExpectation()
        Trakt.mostPlayedMovies(completion: { result in
            switch result {
                case .success(let response):
                    XCTAssertFalse(response.movies.isEmpty)
                case .failure(let error):
                    XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 5)
    }

}
