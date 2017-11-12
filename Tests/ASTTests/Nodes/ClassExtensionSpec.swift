import SSpec
import AST

func classExtensionSpec() {
  describe("AST.ClassExtension") {
    let subject = AST.Class(name: "MyClass")
    let generic = AST.GenericType(name: "T")
    var ext: AST.ClassExtension!

    before {
      subject.types.append(generic)
    }

    context("Simple extension") {
      before {
        ext = AST.ClassExtension(subject: subject)
      }

      it("generates extension code with empty body") {
        expect(ext.code(indent: 0)).to.eq("extension MyClass {\n}")
        expect(ext.code(indent: 1)).to.eq("  extension MyClass {\n  }")
      }
    }

    context("Extension with constraint") {
      let doubleType = AST.Class(name: "Double")

      before {
        ext = AST.ClassExtension(subject: subject)
        ext.constraint = .Equality(generic, doubleType)
      }

      it("generates extension with where clause") {
        expect(ext.code(indent: 0)).to.eq("extension MyClass where T == Double {\n}")
      }
    }
  }
}
