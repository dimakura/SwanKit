import SSpec
import AST

func emptyLineSpec() {
  describe("AST.EmptyLine") {
    var emptyLine: AST.EmptyLine!

    context("one line") {
      before {
        emptyLine = AST.EmptyLine(lines: 1)
      }

      it("generates empty string") {
        expect(emptyLine.code(indent: 0)).to.eq("")
      }
    }

    context("three lines") {
      before {
        emptyLine = AST.EmptyLine(lines: 3)
      }

      it("generates 2 empty line") {
        expect(emptyLine.code(indent: 0)).to.eq("\n\n")
      }
    }
  }
}
