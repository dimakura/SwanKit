import SSpec
import AST

func commentSpec() {
  describe("AST.Comment") {
    var comment: AST.Comment!

    describe("Default comment") {
      before {
        comment = AST.Comment(text: "Some comment")
      }

      it("generates default comment") {
        expect(comment.code(indent: 0)).to.eq("// Some comment")
        expect(comment.code(indent: 1)).to.eq("  // Some comment")
      }
    }

    describe("Document comment") {
      before {
        comment = AST.Comment(text: "Some comment", kind: .Document)
      }

      it("generates default comment") {
        expect(comment.code(indent: 0)).to.eq("/// Some comment")
        expect(comment.code(indent: 1)).to.eq("  /// Some comment")
      }
    }

    describe("Multiline comment") {
      before {
        comment = AST.Comment(text: "line1\nline2")
      }

      it("generates comment on two lines") {
        expect(comment.code(indent: 0)).to.eq("// line1\n// line2")
      }
    }
  }
}
