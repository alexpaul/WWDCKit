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

## 2. Update the `Package.swift` as needed 

1. Let's restrict this Package to iOS 15.

```swift
let package = Package(
    name: "WWDCKit",
    platforms: [
        .iOS(.v15)
    ],
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

## 3. Create a new `SwiftUI` View

For the purposes of this demo we will create a SwiftUI view called `WWDCView`. This view will be available via this Swift Package.

1. Create a new SwiftUI view file called `WWDCView` inside the "Sources" folder. 

```swift 
import SwiftUI

struct WWDCView: View {
    var body: some View {
        Text("WWDC 2022")
    }
}

struct WWDCView_Previews: PreviewProvider {
    static var previews: some View {
        WWDCView()
    }
}
```

## 4. Updated WWDCView 

Pay close attention to the `public` access modifiers. Any part of your Package you need exposed to clients will be required to have the `public` access modifier applied to the type including the initializer here.

```swift
import SwiftUI

public struct WWDCView: View {
    public init() {}

    public var body: some View {
        ScrollView {
            HStack {
                Text("WWDC22")
                    .font(.headline)
                Spacer()
                Text("Overview")
                Text("Swift Student Challenge")
            }
            .padding()
            .background(Color.black)
            Image(systemName: "chevron.left.forwardslash.chevron.right")
                .font(.largeTitle)
            VStack(alignment: .center) {
                Text("Call to code.")
                    .font(.largeTitle)
                    .padding(.bottom, 10)
                Text("Join developers worldwide from June 6 to 10 for an inspiring week of technology and community. Get a first look at Apple’s latest platforms and technologies in sessions, explore the newest tools and tips, and connect with Apple experts in labs and digital lounges. All online and at no cost.")
                    .textStyle()
                Text("In addition to the online conference, Apple will host a special day for developers and students at Apple Park on June 6 to watch the keynote and State of the Union videos together, along with the online community. Space is limited and details on how to apply to attend will be provided soon.")
                    .textStyle()
                Text("Wherever you watch from, get ready for a fantastic WWDC.")
                    .textStyle()
                Text("Talented students can showcase their creativity for the opportunity to receive an award in the [Swift Student Challenge](https://developer.apple.com/wwdc22/swift-student-challenge/).")
                    .textStyle()
            }.padding()
        }
        .foregroundColor(.white)
        .background(.primary)
    }
}

struct WWDCView_Previews: PreviewProvider {
    static var previews: some View {
        WWDCView()
    }
}


struct TextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .padding(.bottom, 10)
    }
}

extension View {
    func textStyle() -> some View {
        modifier(TextStyle())
    }
}
```

## 5. Publishing the Swift Package

For now since we're testing out this package we won't add a `tag` to the commit which allows for versioning.

## 6. Using this Swift Package

1. Create a demo app iOS app called "WWDCPackageDemo" (ensure SwiftUI is the selected Interface). 
2. Navigate to File >> Add Packages...
3. Enter the following url `https://github.com/alexpaul/WWDCKit` in the Search field dialog.
4. For "Dependency Rule" select "Branch" and `main` should be the default.
5. Select "Add Package".
6. The "WWDCKit" Package is now able to be used.

## 7. Using the WWDCKit Package 

1. Navigate to `ContentView.swift`.
2. Add `import WWDCKit`.
3. Modify the code so it looks similar to the following: 

```swift
import SwiftUI
import WWDCKit

struct ContentView: View {
    var body: some View {
        WWDCView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

![wwdcview](https://user-images.githubusercontent.com/1819208/161861450-f7e551a6-a0cd-4bd3-afcb-d1d91df19282.png)




