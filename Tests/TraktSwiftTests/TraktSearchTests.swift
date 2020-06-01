//
//  TraktSearchTests.swift
//  TraktSwift
//
//  Created by Martin Púčik on 05/05/2020.
//

import Foundation
import XCTest
@testable import TraktSwift

final class TraktSearchTests: XCTestCase {
    static var allTests = [
        ("testSearch", testSearch),
        ("testSearchCombine", testSearchCombine)
    ]

    override class func setUp() {
        super.setUp()
        Defaults.clientID = ProcessInfo.processInfo.environment["TESTS_TRAKT_STAGING_CLIENT_ID"] ?? ""
        Defaults.clientSecret = ProcessInfo.processInfo.environment["TESTS_TRAKT_STAGING_CLIENT_SECRET"] ?? ""
    }

    func testSearch() {
        let expectation = XCTestExpectation()
        let request = Trakt.search(query: "tron legacy", in: [.movie], completion: { result in
            switch result {
            case .success(let response):
                XCTAssertFalse(response.results.isEmpty)
                expectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        })
        XCTAssertEqual(request.originalRequest?.url?.path, "/search/movie")
        XCTAssertEqual(request.originalRequest?.url?.query, "query=tron%20legacy")
        wait(for: [expectation], timeout: 5)
    }

    func testSearchCombine() {
        let expectation = XCTestExpectation()
        let request = Trakt.search(query: "tron legacy", in: [.movie])
            .sink(receiveCompletion: { result in

            }, receiveValue: { response in
                XCTAssertFalse(response.results.isEmpty)
            })

//        search(query: "tron legacy", in: [.movie], completion: { result in
//            switch result {
//                case .success(let response):
//                    XCTAssertFalse(response.results.isEmpty)
//                    expectation.fulfill()
//                case .failure(let error):
//                    XCTFail(error.localizedDescription)
//            }
//        })
//        XCTAssertEqual(request.originalRequest?.url?.path, "/search/movie")
//        XCTAssertEqual(request.originalRequest?.url?.query, "query=tron%20legacy")
        wait(for: [expectation], timeout: 5)
    }
}
