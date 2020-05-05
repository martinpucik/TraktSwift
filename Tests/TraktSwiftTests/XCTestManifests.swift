//
//  XCTestManifests.swift
//  TraktSwift
//
//  Created by Martin Púčik on 02/05/2020.
//

import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(TraktSwiftTests.allTests),
    ]
}
#endif
