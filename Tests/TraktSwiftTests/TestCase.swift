//
//  TestCase.swift
//  TraktSwift
//
//  Created by Martin Púčik on 01/06/2020.
//

import Foundation
import XCTest
@testable import TraktSwift

#if canImport(Combine)
import Combine
#endif

class TestCase: XCTestCase {
    let client: Trakt = Trakt(clientID: ProcessInfo.processInfo.environment["TESTS_TRAKT_STAGING_CLIENT_ID"]!,
                              clientSecret: ProcessInfo.processInfo.environment["TESTS_TRAKT_STAGING_CLIENT_SECRET"]!,
                              client: Client(baseURL: URL(string: "https://api-staging.trakt.tv")!))
}

@available(OSX 10.15, *)
class CombineTestCase: TestCase {
    var bag = Set<AnyCancellable>()

    override func setUp() {
        super.setUp()
        bag = Set<AnyCancellable>()
    }
}
