//
//  TraktAPIClientTests.swift
//  TraktSwift
//
//  Created by Martin Púčik on 08/06/2020.
//

import Foundation
import XCTest
@testable import TraktSwift

final class TraktAPIClientTests: TestCase {
    func testDefaultClientInit() {

    }

    func testTestCaseClientInit() {
        let client = Client(baseURL: URL(string: "https://google.com")!)
        XCTAssertEqual("https://google.com", client.baseURL.absoluteString)
    }
}
