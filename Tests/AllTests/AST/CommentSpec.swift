import AST
import SSpec

func spec_Comment() {
  describe("AST.Comment") {
    var comment: AST.Comment!

    context("default comment") {
      before {
        comment = AST.Comment(text: "Line1\nLine2")
      }

      it("generes comment") {
        expect(comment.code(indent: 0)).to.eq("// Line1\n// Line2\n")
        expect(comment.code(indent: 1)).to.eq("  // Line1\n  // Line2\n")
      }
    }

    context("documentation comment") {
      before {
        comment = AST.Comment(text: "Line1\nLine2", isDocumentation: true)
      }

      it("generes comment") {
        expect(comment.code(indent: 0)).to.eq("/// Line1\n/// Line2\n")
        expect(comment.code(indent: 1)).to.eq("  /// Line1\n  /// Line2\n")
      }
    }
  }
}
