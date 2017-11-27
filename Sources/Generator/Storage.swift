import AST

fileprivate let storageExtensionPath = "Sources/SwanKit/Storage"

fileprivate let documentation = [
  "cos": "cosine function",
  "sin": "sine function",
  "tan": "tangent function",
  "acos": "arccosine function",
  "asin": "arcsine function",
  "atan": "arctangent function",
  "cosh": "hyperbolic cosine function",
  "sinh": "hyperbolic sine function",
  "tanh": "hyperbolic tangent function",
  "acosh": "inverse hyperbolic cosine function",
  "asinh": "inverse hyperbolic sine function",
  "atanh": "inverse hyperbolic tangent function",
]

fileprivate func generateFunction(ext: AST.Extension, type: String, name: String) {
  let accelerateName = type == "Double" ? "vv" + name : "vv" + name + "f"

  // cloning function
  if let doc = documentation[name] {
    ext.docComment("Cloning " + doc + ".")
  }
  ext.function(name, "SWKStorage<T>") { fn in
    fn.line("let newStorage = SWKStorage(size)")
    fn.line(accelerateName + "(newStorage.storage, storage, &size32)")
    fn.line("return newStorage")
  }

  ext.empty()

  // in-place function
  if let doc = documentation[name] {
    ext.docComment("In-place " + doc + ".")
  }
  ext.function(name + "_") { fn  in
    fn.line(accelerateName + "(storage, storage, &size32)")
  }

  ext.empty()
}

fileprivate func generateSWKStorageExtension(type: String) {
  createSourceFile(name: "SWKStorage+" + type, path: storageExtensionPath) { src in
    src.comment(generationNotice)
    src.empty()
    src.line("import Accelerate")
    src.empty()
    src.docComment("SWKStorage extension for " + type + ".")
    src.typeExtension("SWKStorage", "T == " + type) { ext in
      // trigonometric functions
      generateFunction(ext: ext, type: type, name: "cos")
      generateFunction(ext: ext, type: type, name: "sin")
      generateFunction(ext: ext, type: type, name: "tan")
      generateFunction(ext: ext, type: type, name: "acos")
      generateFunction(ext: ext, type: type, name: "asin")
      generateFunction(ext: ext, type: type, name: "atan")
      // hyperbolic functions
      generateFunction(ext: ext, type: type, name: "cosh")
      generateFunction(ext: ext, type: type, name: "sinh")
      generateFunction(ext: ext, type: type, name: "tanh")
      generateFunction(ext: ext, type: type, name: "acosh")
      generateFunction(ext: ext, type: type, name: "asinh")
      generateFunction(ext: ext, type: type, name: "atanh")
    }
  }
}

func generateStorageExtensions() {
  for type in ["Float", "Double"] {
    generateSWKStorageExtension(type: type)
    // TODO: generate specs
  }
}
