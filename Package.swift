import PackageDescription

let package = Package(
  name: "BF",
  dependencies: [
    .Package(url: "https://github.com/harlanhaskins/LLVMSwift.git", majorVersion: 0)
  ]
)

