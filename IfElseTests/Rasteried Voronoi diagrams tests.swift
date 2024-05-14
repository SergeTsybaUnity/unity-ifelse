//
//  Rasteried Voronoi diagrams tests.swift
//  IfElseTests
//
//  Created by Serge Tsyba on 13.5.2024.
//

import XCTest

class RasterizedVoronoiDiagramsTests: XCTestCase {
	func test1() {
		let seeds = [
			Point(x: 1, y: 1),
			Point(x: 7, y: 2),
			Point(x: 2, y: 5),
			Point(x: 5, y: 6)
		]
		
		let partitionable = Space(width: 8, height: 8)
			.partitionsEqually(using: seeds, distance: manhattan(_:_:))
		
		XCTAssertFalse(partitionable)
	}
	
	func test2() {
		let seeds = [
			Point(x: 3, y: 3),
			Point(x: 4, y: 3),
			Point(x: 3, y: 4),
			Point(x: 4, y: 4)
		]
		
		let partitionable = Space(width: 8, height: 8)
			.partitionsEqually(using: seeds, distance: manhattan(_:_:))
		
		XCTAssertTrue(partitionable)
	}
	
	func test3() {
		let seeds = [
			Point(x: 0, y: 0),
			Point(x: 7, y: 0),
			Point(x: 0, y: 7),
			Point(x: 7, y: 7)
		]
		
		let partitionable = Space(width: 8, height: 8)
			.partitionsEqually(using: seeds, distance: manhattan(_:_:))
		
		XCTAssertTrue(partitionable)
	}
	
	func test4() {
		let count = rasterizedVoronoiDigrams(spaceSize: 8)
		XCTAssertEqual(count, 68)
	}
}
