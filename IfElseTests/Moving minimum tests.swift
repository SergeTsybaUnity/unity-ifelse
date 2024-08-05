//
//  Moving minimum tests.swift
//  IfElseTests
//
//  Created by Serge Tsyba on 5.8.2024.
//

import XCTest

class MovingMinimumTests: XCTestCase {
	func test1() {
		let sum = movingMin(count: 20, width: 4, digits: 1)
		XCTAssertEqual(sum, 26)
	}
}
