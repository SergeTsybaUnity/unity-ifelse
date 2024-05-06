//
//  main.swift
//  IfElse
//
//  Created by Serge Tsyba on 26.4.2024.
//

typealias Program = (any Sequence<String>) -> ()

let programs: [String: Program] = [
	"champernowne": { _ in
		let word = ChampernowneWord()
		var indexes = (1...4)
			.flatMap({ word.nthIndexes(digitCount: $0) })
		
		let index = word.nthIndex(of: 10000)
		indexes.append(index)
		
		for index in indexes.enumerated() {
			print("\(index.0 + 1)\t\(index.1)")
		}
	},
	"squared-away": { _ in
		let sum = (1...1_000_000_000_000)
			.map({ $0.squares.count })
			.reduce(0, +)
		
		print(sum)
	}
]

let arguments = CommandLine.arguments
guard arguments.count >= 2 else {
	printUsage()
	exit(1)
}
guard let program = programs[arguments[1]] else {
	printUsage()
	exit(1)
}

program(arguments.suffix(from: 1))


// MARK: -
// MARK: Convenience functionality
private func printUsage() {
	let name = CommandLine.arguments[0]
	let commands = programs.keys
		.joined(separator: "|")
	
	print("usage: \(name) [\(commands)]")
}
