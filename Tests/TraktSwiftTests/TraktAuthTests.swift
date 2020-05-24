//
//  TraktAuthTests.swift
//  TraktSwift
//
//  Created by Martin Púčik on 24/05/2020.
//

import Foundation
import XCTest
#if canImport(Combine)
import Combine
#endif
@testable import TraktSwift

final class TraktAuthTests: XCTestCase {

    override class func setUp() {
        super.setUp()
        Defaults.clientID = ProcessInfo.processInfo.environment["TESTS_TRAKT_STAGING_CLIENT_ID"] ?? ""
        Defaults.clientSecret = ProcessInfo.processInfo.environment["TESTS_TRAKT_STAGING_CLIENT_SECRET"] ?? ""
    }

    @available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func testGenerateDeviceCodePublisher() {
        let expectation = XCTestExpectation()
        var bag = Set<AnyCancellable>()
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
        wait(for: [expectation], timeout: 5)
    }
}
