import AST
import SSpec

func spec_Extension() {
  describe("AST.Extension") {
    var ext: AST.Extension!

    before {
      ext = AST.Extension(type: "SWKStorage")
    }

    it("generates extension code") {
      expect(ext.code(indent: 0)).to.eq("extension SWKStorage {\n}\n")
      expect(ext.code(indent: 1)).to.eq("  extension SWKStorage {\n  }\n")
    }

    context("with where clause") {
      before {
        ext.whereClause = "T == Double"
      }

      it("generates extension code") {
        expect(ext.code(indent: 0)).to.eq("extension SWKStorage where T == Double {\n}\n")
        expect(ext.code(indent: 1)).to.eq("  extension SWKStorage where T == Double {\n  }\n")
      }
    }

    context("with children") {
      before {
        ext.children.append(AST.Comment(text: "Some comment"))
      }

      it("generates extension code") {
        expect(ext.code(indent: 0)).to.eq("extension SWKStorage {\n  // Some comment\n}\n")
        expect(ext.code(indent: 1)).to.eq("  extension SWKStorage {\n    // Some comment\n  }\n")
      }
    }
  }
}
