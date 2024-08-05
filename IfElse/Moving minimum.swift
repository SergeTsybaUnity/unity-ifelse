//
//  Moving minimum.swift
//  IfElse
//
//  Created by Serge Tsyba on 5.8.2024.
//

import Foundation

func movingMin(count: Int, width: Int, digits: Int) -> Int {
	return MovingMinimumSequence(width: width, digits: digits)
		.prefix(count - width)
		.reduce(0, +)
}

private struct MovingMinimumSequence: Sequence, IteratorProtocol {
	private var incoming: GenerateSequence
	private var outgoing: GenerateSequence
	
	private var counts: [Int]
	private var min: Int
	
	init(width: Int, digits: Int) {
		self.incoming = GenerateSequence(digits: digits)
		self.outgoing = GenerateSequence(digits: digits)
		
		let count = Int(pow(10.0, Double(digits)))
		self.counts = Array(repeating: 0, count: count)
		
		for _ in 0..<width {
			let incoming = self.incoming.next()!
			counts[incoming] += 1
		}
		
		self.min = self.counts
			.firstIndex(where: { $0 > 0 }) ?? 0
	}
	
	mutating func next() -> Int? {
		let incoming = self.incoming.next()!
		self.counts[incoming] += 1
		
		let outgoing = self.outgoing.next()!
		self.counts[outgoing] -= 1
		
		if incoming < self.min
			|| self.counts[self.min] == 0 {
			self.min = self.counts
				.firstIndex(where: { $0 > 0 }) ?? 0
		}
		
		return self.min
	}
}

private struct GenerateSequence: Sequence, IteratorProtocol {
	private let mod: Int
	private var value: Int = 15486347
	
	init(digits: Int) {
		self.mod = Int(pow(10.0, Double(digits)))
	}
	
	mutating func next() -> Int? {
		self.value *= self.value
		self.value %= 373588403
		
		return self.value % self.mod
	}
}
