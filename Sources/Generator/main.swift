import AST

let generatedDir = "Sources/SwanKit-Generated"
let autogeneratedWarning = "NB: This file is autogenerated by Generator. Don't change it manually."

let resp = AST.createFile(generatedDir + "/SWKStorage+Float.swift") { src in
  src.comment(autogeneratedWarning)
  src.emptyLine()
  src.packageImport("Acceleration")
}

print(resp ? "Success" : "Failed")
