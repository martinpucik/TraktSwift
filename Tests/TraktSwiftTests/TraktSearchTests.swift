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
}

@available(OSX 10.15, *)
final class TraktSearchCombineTests: TestCase {
    static var allTests = [
        ("testSearchCombine", testSearchCombine)
    ]

    private var bag = Set<AnyCancellable>()

    func testSearchCombine() {
        let expectation = XCTestExpectation()
        Trakt.search(query: "tron legacy", in: [.movie])
            .sink(receiveCompletion: { result in

            }, receiveValue: { response in
                XCTAssertFalse(response.results.isEmpty)
            }).store(in: &bag)
        wait(for: [expectation], timeout: 5)
    }
}
