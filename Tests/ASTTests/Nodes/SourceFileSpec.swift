import SSpec
import AST

func sourceFileSpec() {
  describe("AST.SourceFile") {
    var source: AST.SourceFile!

    before {
      source = AST.SourceFile(path: "Sources/Test.swift")
      source.children.append(AST.Comment(text: "Test Comment"))
      source.children.append(AST.ImportStatement(package: AST.Package(name: "Accelerate")))
    }

    it("generates source code") {
      let code = source.code(indent: 0)
      let expectedCode = "// Test Comment\nimport Accelerate\n"
      expect(code).to.eq(expectedCode)
    }
  }
}
