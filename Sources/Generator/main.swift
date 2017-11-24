import AST

let generatedDir = "Sources/SwanKit-Generated"
let autogeneratedWarning = "NB: This file is autogenerated by Generator. Don't change it manually."

let swkStorage = AST.describeClass("SWKStorage") { cls in
  _ = cls.addGeneric("T")
}
let floatClass = AST.Class(name: "Float")

let resp = AST.createFile(generatedDir + "/SWKStorage+Float.swift") { src in
  src.comment(autogeneratedWarning)
  src.emptyLine()
  src.packageImport("Acceleration")
  src.emptyLine()
  src.docComment("SWKStorage extensions for Float type.")
  _ = src.classExtension(swkStorage) { ext in
    ext.addEqualityConstraint(swkStorage.types[0], floatClass)
  }
  // let genericType = AST.genericType(name: "T")
  // let storageClass = AST.describeClass("SWKStorage", genericTypes: [genericType])
  // src.extension(storageClass, where: .equals(genericType, "Double")) { ext in
  //   ext.method("cos", returns: storageClass) { in method
  //     let newStorage = SWKStorage<T>()
  //     vvcos(newStorage.storage, storage, &size32)
  //     return newStorage
  //   }
  // }
}

print(resp ? "Success" : "Failed")
