//
//  StringTests.swift
//  ExValidator
//
//  Created by Kenta Nakai on 2015/06/02.
//  Copyright (c) 2015 UROURO. All rights reserved.
//

import ExValidator
import Foundation
import XCTest

class StringTests : XCTestCase {
    
    func testRequired() {
        XCTAssertTrue("foo".validate([.Required]))
        XCTAssertFalse("".validate([.Required]))
    }
    
    func testMin() {
        XCTAssertTrue("foo".validate([.Min(0)]))
        XCTAssertTrue("foo".validate([.Min(1)]))
        XCTAssertFalse("foo".validate([.Min(4)]))
        XCTAssertTrue("".validate([.Min(0)]))
        XCTAssertFalse("".validate([.Min(1)]))
    }
    
    func testMax() {
        XCTAssertTrue("foo".validate([.Max(4)]))
        XCTAssertTrue("foo".validate([.Max(3)]))
        XCTAssertFalse("foo".validate([.Max(2)]))
        XCTAssertFalse("foo".validate([.Max(0)]))
        XCTAssertTrue("".validate([.Max(1)]))
        XCTAssertTrue("".validate([.Max(0)]))
    }
    
    func testEmail() {
        XCTAssertTrue("hello@example.com".validate([.Email]))
        XCTAssertFalse("@example.com".validate([.Email]))
        XCTAssertFalse("hello@".validate([.Email]))
        XCTAssertFalse("nruvosmek".validate([.Email]))
        XCTAssertFalse("hello@example.i".validate([.Email]))
    }
    
    func testURL() {
        XCTAssertTrue("http://www.google.com".validate([.URL]))
        XCTAssertTrue("http://example.jp".validate([.URL]))
        XCTAssertTrue("http://google.com/foo/bar".validate([.URL]))
        XCTAssertTrue("http://google.com?foo=bar".validate([.URL]))
        XCTAssertTrue("http://google.com?ref=abcde&foo=bar".validate([.URL]))
        XCTAssertTrue("https://google.com".validate([.URL]))
        XCTAssertTrue("https://www.google.com".validate([.URL]))
        XCTAssertTrue("http://username:password@google.com".validate([.URL]))
        XCTAssertTrue("http://google.com:8000".validate([.URL]))
        XCTAssertTrue("http://username:password@google.com:8000/foo/bar?foo=bar&ref=abcde".validate([.URL]))
        XCTAssertTrue("google.com".validate([.URL]))
        XCTAssertTrue("google.com/foo/bar".validate([.URL]))
        XCTAssertTrue("google.com/foo.html".validate([.URL]))
        XCTAssertTrue("google.com/foo/bar?foo=bar".validate([.URL]))
        XCTAssertTrue("google.com/foo/bar?ref=abcde&foo=bar".validate([.URL]))
        XCTAssertFalse("http://.jp".validate([.URL]))
        XCTAssertFalse("foobar".validate([.URL]))
        XCTAssertFalse("".validate([.URL]))
        
        // Schemes except for http(s) are not supported yet
        XCTAssertFalse("ftp://example.com".validate([.URL]))
        
        // Japanese URLs are not suppoerted yet
        XCTAssertFalse("http://あいうえお.com".validate([.URL]))
        XCTAssertFalse("あいうえお.com".validate([.URL]))
    }
}