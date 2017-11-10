import SSpec
import AST

func sourceFileSpec() {
  describe("AST.SourceFile") {
    var source: AST.SourceFile!

    before {
      source = AST.SourceFile(path: "Sources/Test.swift")
      source.addChild(node: AST.Comment(text: "Test Comment"))
      source.addChild(node: AST.ImportStatement(package: AST.Package(name: "Accelerate")))
    }

    it("generates source code") {
      let code = source.code(indent: 0)
      let expectedCode = "// Test Comment\n\nimport Accelerate\n"
      expect(code).to.eq(expectedCode)
    }
  }
}
