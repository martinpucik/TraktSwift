//
//  TraktSearchResourceTests.swift
//  TraktSwift
//
//  Created by Martin Púčik on 08/06/2020.
//

import Foundation
import XCTest
@testable import TraktSwift

final class TraktSearchResourceTests: XCTestCase {

    func testSearchResource() {
        let resource = TraktSwift.Resource.Search.search(query: "", scopes: [.movie], clientID: "")
        XCTAssertEqual(resource.path, "/search/movie")
        XCTAssertEqual(resource.method, HttpMethod.GET)
        XCTAssertEqual(resource.parameters, ["query": ""])
        XCTAssertNil(resource.page)
    }
}
