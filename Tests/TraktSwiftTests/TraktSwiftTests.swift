//
//  TraktSwiftTests.swift
//  TraktSwift
//
//  Created by Martin Púčik on 02/05/2020.
//

import Foundation
import XCTest
@testable import TraktSwift

final class TraktSwiftTests: TestCase {
    static var allTests = [
        ("testTrendingMovies", testTrendingMovies),
        ("testPopularMovies", testPopularMovies),
        ("testMostPlayerMovies", testMostPlayerMovies)
    ]
    
    func testTrendingMovies() {
        let expectation = XCTestExpectation()
        client.trendingMovies(completion: { result in
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
        client.popularMovies(completion: { result in
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
        client.mostPlayedMovies(completion: { result in
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
