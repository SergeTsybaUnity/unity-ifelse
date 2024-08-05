//
//  main.swift
//  IfElse
//
//  Created by Serge Tsyba on 26.4.2024.
//

typealias Program = (any Sequence<String>) -> ()

let programs: [String: Program] = [
	"champernowne-word": { _ in
		print(champernowneWord())
	},
	"squared-away": { _ in
		print(squaredAway())
	},
	"rasterized-voronoi-diagrams": { _ in
		print(rasterizedVoronoiDigrams())
	},
	"moving-minimum": { _ in
		print(movingMin(count: 10_000_000, width: 1000, digits: 3))
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

program(arguments.suffix(from: 2))


// MARK: -
// MARK: Convenience functionality
private func printUsage() {
	let program = CommandLine.arguments[0]
	print("usage: \(program) <command>")
	print("commands:")
	
	for command in programs.keys {
		print("\t\(command)")
	}
}
