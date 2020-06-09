//
//  TraktSearchTests.swift
//  TraktSwift
//
//  Created by Martin Púčik on 05/05/2020.
//

import Foundation
import XCTest
@testable import TraktSwift

#if canImport(Combine)
import Combine
#endif

final class TraktSearchTests: TestCase {

    static var allTests = [
        ("testSearch", testSearch),
    ]

    func testSearch() {
        let expectation = XCTestExpectation()
        let request = client.search(query: "tron legacy", in: [.movie], completion: { result in
            switch result {
            case .success(let response):
                XCTAssertFalse(response.results.isEmpty)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        })
        print(request.originalRequest)
        XCTAssertEqual(request.originalRequest?.url?.path, "/search/movie")
        XCTAssertEqual(request.originalRequest?.url?.query, "query=tron%20legacy")
        wait(for: [expectation], timeout: 15)
    }
}

@available(OSX 10.15, *)
final class TraktSearchCombineTests: CombineTestCase {

    static var allTests = [
        ("testSearchCombine", testSearchCombine)
    ]

    func testSearchCombine() {
        let expectation = XCTestExpectation()
        client.search(query: "tron legacy", in: [.movie])
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    XCTFail(error.localizedDescription)
                    expectation.fulfill()
                default: break
                }
            }, receiveValue: { response in
                XCTAssertFalse(response.results.isEmpty)
                expectation.fulfill()
            }).store(in: &bag)
        wait(for: [expectation], timeout: 5)
    }
}
