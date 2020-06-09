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
final class TraktAuthCombineTests: CombineTestCase {

    static var allTests = [
        ("testGenerateDeviceCodePublisher", testGenerateDeviceCodePublisher),
    ]

    func testGenerateDeviceCodePublisher() {
        let expectation = XCTestExpectation()
        client.generateDeviceCode
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    XCTFail(error.localizedDescription)
                    expectation.fulfill()
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
