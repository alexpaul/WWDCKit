# WWDCKit - Creating and Using a Swift Package 

## 1. Create the Package in Xcode 

1. Navigate to File >> New >> Package. 
2. Give the Package a name e.g "WWDCKit".

#### Package.swift 

```swift 
let package = Package(
    name: "WWDCKit",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "WWDCKit",
            targets: ["WWDCKit"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "WWDCKit",
            dependencies: []),
        .testTarget(
            name: "WWDCKitTests",
            dependencies: ["WWDCKit"]),
    ]
)
```
