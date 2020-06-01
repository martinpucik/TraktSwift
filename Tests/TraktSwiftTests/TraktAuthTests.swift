//
//  TraktAuthTests.swift
//  TraktSwift
//
//  Created by Martin Púčik on 24/05/2020.
//

import Foundation
import XCTest
@testable import TraktSwift

#if canImport(Combine)
import Combine
#endif

final class TraktAuthTests: TestCase {


}

@available(OSX 10.15, *)
final class TraktAuthCombineTests: TestCase {

    static var allTests = [
        ("testGenerateDeviceCodePublisher", testGenerateDeviceCodePublisher),
    ]

    private var bag = Set<AnyCancellable>()

    func testGenerateDeviceCodePublisher() {
        let expectation = XCTestExpectation()
        Trakt.generateDeviceCode
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .failure(let error): XCTFail(error.localizedDescription)
                    default: break
                }
            }, receiveValue: { response in
                XCTAssertFalse(response.deviceCode.isEmpty)
                XCTAssertTrue(response.userCode.count == 8)
                XCTAssertEqual(response.verificationURL.absoluteString, "https://staging.trakt.tv/activate")
                XCTAssertEqual(response.verificationURL.absoluteString, "https://staging.trakt.tv/activate")
                XCTAssertEqual(response.expiresIn, 600)
                XCTAssertEqual(response.interval, 5)
                expectation.fulfill()
            }).store(in: &bag)
        wait(for: [expectation], timeout: 10)
    }
}
