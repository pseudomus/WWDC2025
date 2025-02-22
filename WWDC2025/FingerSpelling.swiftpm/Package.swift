// swift-tools-version: 6.0

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "FingerSpelling",
    platforms: [
        .iOS("16.0")
    ],
    products: [
        .iOSApplication(
            name: "FingerSpelling",
            targets: ["AppModule"],
            bundleIdentifier: "wwdcappPlayground.FingerSpelling",
            teamIdentifier: "SRXHT55569",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .gift),
            accentColor: .presetColor(.blue),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ],
            capabilities: [
                .camera(purposeString: "Unknown Usage Descriptiontest")
            ]
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: ".",
            resources: [
                .process("Resources"),
                .copy("MLFile/FingerSpellingModel.mlmodelc")
            ]
        )
    ],
    swiftLanguageVersions: [.version("6")]
)
