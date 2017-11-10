import SSpec
import AST

func importStatementSpec() {
  describe("AST.ImportStatement") {
    var package: AST.Package!
    var packageImport: AST.ImportStatement!

    before {
      package = AST.Package(name: "Accelerate")
      packageImport = AST.ImportStatement(package: package)
    }

    it("generates import statement") {
      expect(packageImport.code(indent: 0)).to.eq("import Accelerate")
      expect(packageImport.code(indent: 1)).to.eq("  import Accelerate")
    }
  }
}
