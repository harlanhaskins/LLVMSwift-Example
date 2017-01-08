import PackageDescription

let package = Package(
  name: "HelloLLVM",
  dependencies: [
    .Package(url: "https://github.com/harlanhaskins/LLVMSwift.git", majorVersion: 0)
  ]
)

