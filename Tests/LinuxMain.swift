//
//  LinuxMain.swift
//  TraktSwift
//
//  Created by Martin Púčik on 02/05/2020.
//

import XCTest

import TraktSwiftTests

var tests = [XCTestCaseEntry]()
tests += TraktSwiftTests.allTests()
XCTMain(tests)
