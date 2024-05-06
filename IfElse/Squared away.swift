//
//  Squared away.swift
//  IfElse
//
//  Created by Serge Tsyba on 6.5.2024.
//

import Foundation

extension Int {
	var squares: [Int] {
		var remainder = self
		var squares: [Int] = []
		
		while remainder > 0 {
			let next = sqrti(remainder)
			squares.append(next)
			remainder -= next * next
		}
		
		return squares
	}
}

func sqrti(_ x: Int) -> Int {
	return Int(sqrt(Double(x)))
}
