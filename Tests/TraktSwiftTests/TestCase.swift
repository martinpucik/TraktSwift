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
    override class func setUp() {
        super.setUp()
        Defaults.clientID = ProcessInfo.processInfo.environment["TESTS_TRAKT_STAGING_CLIENT_ID"] ?? ""
        Defaults.clientSecret = ProcessInfo.processInfo.environment["TESTS_TRAKT_STAGING_CLIENT_SECRET"] ?? ""
    }
}

@available(OSX 10.15, *)
class CombineTestCase: TestCase {
    var bag = Set<AnyCancellable>()
}
