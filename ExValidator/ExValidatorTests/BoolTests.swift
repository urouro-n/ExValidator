//
//  BoolTests.swift
//  ExValidator
//
//  Created by Kenta Nakai on 2015/06/03.
//  Copyright (c) 2015年 UROURO. All rights reserved.
//

import ExValidator
import Foundation
import XCTest

class BoolTests : XCTestCase {
    
    func testRequired() {
        XCTAssertTrue(true.validate([.Required]))
        XCTAssertTrue(false.validate([.Required]))
    }
    
    func testMin() {
        XCTAssertTrue(true.validate([.Min(0)]))
    }
    
    func testMax() {
        XCTAssertTrue(true.validate([.Max(0)]))
    }
}
