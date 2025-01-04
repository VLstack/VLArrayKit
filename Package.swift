// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(name: "VLArrayKit",
                      products:
                      [
                       .library(name: "VLArrayKit",
                                targets: [ "VLArrayKit" ])
                      ],
                      targets:
                      [
                       .target(name: "VLArrayKit")
                      ])
