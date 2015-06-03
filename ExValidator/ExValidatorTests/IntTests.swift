//
//  IntTests.swift
//  ExValidator
//
//  Created by Kenta Nakai on 2015/06/03.
//  Copyright (c) 2015 UROURO. All rights reserved.
//

import ExValidator
import Foundation
import XCTest

class IntTests : XCTestCase {
    
    func testRequired() {
        XCTAssertTrue(100.validate([.Required]))
        XCTAssertTrue(0.validate([.Required]))
    }
    
    func testMin() {
        XCTAssertTrue(100.validate([.Min(0)]))
        XCTAssertTrue(100.validate([.Min(1)]))
        XCTAssertFalse(100.validate([.Min(101)]))
        XCTAssertTrue(0.validate([.Min(0)]))
        XCTAssertFalse(0.validate([.Min(1)]))
    }
    
    func testMax() {
        XCTAssertTrue(100.validate([.Max(101)]))
        XCTAssertTrue(100.validate([.Max(100)]))
        XCTAssertFalse(100.validate([.Max(99)]))
        XCTAssertFalse(100.validate([.Max(0)]))
        XCTAssertTrue(0.validate([.Max(1)]))
        XCTAssertTrue(0.validate([.Max(0)]))
    }
    
    func testEmail() {
        XCTAssertFalse(0.validate([.Email]))
        XCTAssertFalse(100.validate([.Email]))
    }
}