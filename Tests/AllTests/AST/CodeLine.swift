import AST
import SSpec

func spec_CodeLine() {
  var line: AST.CodeLine!

  before {
    line = AST.CodeLine(line: "import Accelerate")
  }

  it("generates line of code") {
    expect(line.code(indent: 0)).to.eq("import Accelerate\n")
    expect(line.code(indent: 1)).to.eq("  import Accelerate\n")
  }
}
