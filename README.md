# Data Structures

**Data Structures** is an open-source package of data structure implementations for the Swift programming language.

## Contents

The package currently provides the following implementations:

- [`Stack<Element>`][Stack], array-based data structure implementing `push` and `pop` operations at the top with last-in,first-out, or LIFO, policy.

[Stack]: Documentation/Stack.md

Swift **DataStructures** provides a standalone module for each thematic group of data structures it implements. For instance, if you only need a `Stack` type, you can pull in only that by importing `StackModule`. 

However, there is also a top-level `DataStructures` module that gives you every data structure with a single import statement:

``` swift
import DataStructures

var stack: Stack<Int> = [1, 2]
stack.push(3)
stack.push(4)
print(stack) 
// ----top----
// 4
// 3
// 2
// 1
// -----------
```

## Using **Data Structures** in your project

To use this package in a SwiftPM project, you need to set it up as a package dependency:

```swift
// swift-tools-version:5.7
import PackageDescription

let package = Package(
  name: "MyPackage",
  dependencies: [
    .package(
      url: "https://github.com/mvalles/data-structures.git", 
      .upToNextMajor(from: "0.0.1") // or `.upToNextMinor
    )
  ],
  targets: [
    .target(
      name: "MyTarget",
      dependencies: [
        .product(name: "DataStructures", package: "data-structures")
      ]
    )
  ]
)
```

## Contributing to Data Structures

Discussions are enabled: [Data Structures Discusions][discussions] where people can ask and answer questions on how to use or work on this package. It's also a great place to discuss its evolution.

If you find something that looks like a bug, please open a [Bug Report][bugreport]! Fill out as many details as you can.

[discussions]: https://github.com/mvalles/data-structures/discussions
[bugreport]: https://github.com/mvalles/data-structures/issues/new?assignees=&labels=bug&template=BUG_REPORT.md

Enjoy! 😀

