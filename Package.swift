// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import Foundation
import os.log
import PackageDescription

let env: [String: Bool] = [
    "USE_CARGO": false,
    "USE_CXX_INTEROP": false,
    "USE_CXX_MODULES": false,
    "INHIBIT_UPSTREAM_WARNINGS": true,
    "STATIC_LIBRARY": false,
]

let USE_CARGO = envBool("USE_CARGO")
let USE_CXX_INTEROP = envBool("USE_CXX_INTEROP")
let USE_CXX_MODULES = envBool("USE_CXX_MODULES")
let INHIBIT_UPSTREAM_WARNINGS = envBool("INHIBIT_UPSTREAM_WARNINGS")
let STATIC_LIBRARY = envBool("STATIC_LIBRARY")

let package = Package(
    name: "SwiftPMPlugins",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13),
        .macCatalyst(.v13),
        .macOS(.v11),
    ],

    products: [
		.plugin(name: "IntentBuilderPlugin", targets: ["IntentBuilderPlugin"]),
		.plugin(name: "LoggerPlugin", targets: ["LoggerPlugin"])
    ],

    dependencies: [],
    targets: [
		// MARK: - Plugins
		.plugin(name: "IntentBuilderPlugin", capability: .buildTool()),
		.plugin(name: "LoggerPlugin", capability: .buildTool()),
    ],
    swiftLanguageVersions: [.v5],
    cLanguageStandard: .gnu11,
    cxxLanguageStandard: .gnucxx14
)

// MARK: - Helpers

func envBool(_ key: String) -> Bool {
    guard let value = ProcessInfo.processInfo.environment[key] else { return env[key, default: true] }
    let trueValues = ["1", "on", "true", "yes"]
    return trueValues.contains(value.lowercased())
}


// MARK: - SideDaemon
//        .executable(
//            name: "SideDaemon",
//            targets: ["SideDaemon"]),

//        .executableTarget(
//            name: "SideDaemon",
//            dependencies: [
//				"Shared",
//				.product(name: "SideKit", package: "SideKit"),
//				.product(name: "AltSign", package: "AltSign"),
//				.product(name: "CoreCrypto", package: "AltSign"),
//				.product(name: "CCoreCrypto", package: "AltSign"),
//				.product(name: "LaunchAtLogin", package: "LaunchAtLogin"),
//			]
//        ),
//
//        .testTarget(
//            name: "SideDaemonTests",
//            dependencies: ["SideDaemon"]
//        ),


// let dependencies_cargo: [Package.Dependency] = {
//	USE_CARGO ? [
//		// CargoPlugin
//		.package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.0.3"),
//		.package(url: "https://github.com/apple/swift-package-manager.git", branch: "release/5.7"),
//		.package(url: "https://github.com/apple/swift-tools-support-core.git", branch: "release/5.7"),
//	] : []
// }()

// let cargo_targets: [Target] = [
//	.executableTarget(
//		name: "Cargo",
//		dependencies: [
//			.product(name: "ArgumentParser", package: "swift-argument-parser"),
//			.product(name: "SwiftPM-auto", package: "swift-package-manager"),
//			.product(name: "SwiftToolsSupport-auto", package: "swift-tools-support-core")
//		]
//	),
//
//	.testTarget(
//		name: "CargoTests",
//		dependencies: ["Cargo"],
//		exclude: [
//			"swiftlint",
//			"xcframework"
//		]
//	),
//
//	.plugin(
//		name: "CargoPlugin",
//		capability: .buildTool(),
//		dependencies: [
//			"Cargo"
//		]
//	),
//
//	.plugin(
//		name: "CargoPlugin-Generate",
//		capability: .command(
//			intent: .custom(
//				verb: "generate-code-from-rust",
//				description: "Creates .c code from your `rust` code"
//			),
//			permissions: [
//				.writeToPackageDirectory(reason: "This command generates source code")
//			]
//		),
//		dependencies: ["Cargo"]
//	)
// ]
