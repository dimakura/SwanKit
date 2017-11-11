import SSpec
import AST

func classExtensionSpec() {
  describe("AST.ClassExtension") {
    let subject = AST.Class(name: "MyClass")
    var ext: AST.ClassExtension!

    context("Simple extension") {
      before {
        ext = AST.ClassExtension(subject: subject)
      }

      it("generates extension code with empty body") {
        expect(ext.code(indent: 0)).to.eq("extension MyClass {\n}")
        expect(ext.code(indent: 1)).to.eq("  extension MyClass {\n  }")
      }
    }
  }
}
