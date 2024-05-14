//
//  Rasterized Voronoi diagrams.swift
//  IfElse
//	https://docs.google.com/document/d/1sKqRiyhQJ7i9FRcvVH9_54ahDlCEm0iaNYkFE6EWAcU
//
//  Created by Serge Tsyba on 13.5.2024.
//

func rasterizedVoronoiDigrams(spaceSize size: Int = 16) -> Int {
	let space = Space(width: size, height: size)
	let area = space.height * space.width
	
	var count = 0
	for index1 in 0..<area {
		for index2 in (index1 + 1)..<area {
			for index3 in (index2 + 1)..<area {
				for index4 in (index3 + 1)..<area {
					let seeds = [
						space.point(at: index1)!,
						space.point(at: index2)!,
						space.point(at: index3)!,
						space.point(at: index4)!
					]
					
					if space.partitionsEqually(using: seeds, distance: manhattan(_:_:)) {
						count += 1
					}
				}
			}
		}
	}
	
	return count
}


// MARK: -
struct Point: Hashable, CustomStringConvertible {
	var x: Int
	var y: Int
	
	var description: String {
		return "(\(self.x), \(self.y))"
	}
}


func manhattan(_ point1: Point, _ point2: Point) -> Int {
	return abs(point1.x - point2.x) + abs(point1.y - point2.y)
}


// MARK: -
struct Space {
	var width: Int
	var height: Int
}

extension Space {
	var points: some Sequence<Point> {
		return PointIterator(space: self)
	}
	
	func point(at index: Int) -> Point? {
		guard index < self.height * self.width else {
			return nil
		}
		
		return Point(
			x: index % self.width,
			y: index / self.width)
	}
	
	func partitionsEqually(using seeds: [Point], distance: (Point, Point) -> Int) -> Bool {
		var sizes = Array(repeating: 0, count: seeds.count)
		for point in self.points {
			// find shortest distances to each point
			let distances = seeds.map({ distance($0, point) })
			let min = distances.min()
			let indexes = distances.enumerated()
				.filter({ $0.1 == min })
			
			// when there are shortest distances to multiple points,
			// space partition has gaps
			guard indexes.count == 1 else {
				return false
			}
			
			// count point in partition
			let index = indexes[0].0
			sizes[index] += 1
		}
		
		// ensure all partition sizes are the same
		return sizes.allSatisfy({ $0 == sizes.first })
	}
}


// MARK: -
struct PointIterator: IteratorProtocol, Sequence {
	private var space: Space
	private var index: Int = 0
	
	init(space: Space) {
		self.space = space
	}
	
	mutating func next() -> Point? {
		guard let point = self.space.point(at: self.index) else {
			return nil
		}
		
		self.index += 1
		return point
	}
}
