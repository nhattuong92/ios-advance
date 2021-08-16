//
//  NSObjectExtTests.swift
//  MovieBoxTests
//
//  Created by Thomas Ngo on 29/7/21.
//  Copyright © 2021 Thomas Ngo. All rights reserved.
//

import XCTest
@testable import MovieBox

final class NSObjectExtTests: XCTestCase {
    func testNSObjectExt_classNameStatic() {
        XCTAssertEqual(NSObjectExtTests.className, "NSObjectExtTests")
    }
    
    func testNSObjectExt_className() {
        let obj = NSObjectExtTests()
        XCTAssertEqual(obj.className, "NSObjectExtTests")
    }
}
