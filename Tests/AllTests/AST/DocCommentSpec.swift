import AST
import SSpec

func spec_DocComment() {
  describe("AST.DocComment") {
    var comment: AST.DocComment!

    before {
      comment = AST.DocComment(text: "Line1\nLine2")
    }

    it("generes comment") {
      expect(comment.code(indent: 1)).to.eq("  /// Line1\n  /// Line2\n")
    }
  }
}
