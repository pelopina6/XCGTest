// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "XCGTest",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "XCGTest",
            targets: ["XCGTest"]),
    ],
    targets: [
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .systemLibrary(
            name: "XCGTestSysLib",
            pkgConfig: "googletest",
            providers: [
                .brew(["googletest"]),
            ]
		),
        .target(
            name: "XCGTest",
            dependencies: ["XCGTestSysLib"],
            publicHeadersPath: ".",
            linkerSettings:[
                .unsafeFlags([
                    "-I/usr/local/opt/googletest/include/",
                    "/usr/local/opt/googletest/lib/libgtest.a",
                    "/usr/local/opt/googletest/lib/libgmock.a",
                    "/usr/local/opt/googletest/lib/libgmock_main.a"
                ])
                ]
            )
    ],
    cLanguageStandard: .gnu11,
    cxxLanguageStandard: .gnucxx14
)
