import SSpec
import AST

func importStatementSpec() {
  describe("AST.ImportStatment") {
    var package: AST.Package!
    var packageImport: AST.ImportStatment!

    before {
      package = AST.Package(name: "Accelerate")
      packageImport = AST.ImportStatment(package: package)
    }

    it("generates import statement") {
      expect(packageImport.code(indent: 0)).to.eq("import Accelerate")
      expect(packageImport.code(indent: 1)).to.eq("  import Accelerate")
    }
  }
}
