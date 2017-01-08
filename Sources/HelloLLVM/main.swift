import LLVMSwift

// Create a module and IR Builder

let module = Module(name: "main")
let builder = IRBuilder(module: module)

// Forward-declare the signature for printf

let printf = builder.addFunction("printf",
                                 type: FunctionType(argTypes: [PointerType.toVoid],
                                                    returnType: IntType.int32,
                                                    isVarArg: true))

// Create the main function (no arguments, returns void)

let main = builder.addFunction("main",
                               type: FunctionType(argTypes: [],
                                                  returnType: VoidType()))

// Create a global string object

var helloWorld = builder.addGlobalString(name: "hello-llvm",
                                         value: "Hello, LLVM!")

// Begin adding code into the entry basic block
let entry = main.appendBasicBlock(named: "entry")

builder.positionAtEnd(of: entry)

// Build a call to printf (by loading the string's value)
builder.buildCall(printf, args: [
    helloWorld.constGEP(indices: [IntType.int64.zero(), IntType.int64.zero()])
])

// Return void
builder.buildRetVoid()

// Dump the module to stderr and verify it!
module.dump()
try module.verify()
