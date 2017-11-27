import AST
import SSpec

func spec_Function() {
  describe("AST.Function") {
    var function: AST.Function!

    context("without return type and body") {
      before {
        function = AST.Function(name: "cos")
      }

      it("generates function") {
        expect(function.code(indent: 0)).to.eq("public func cos() {\n}\n")
        expect(function.code(indent: 1)).to.eq("  public func cos() {\n  }\n")
      }
    }

    context("with return type") {
      before {
        function = AST.Function(name: "cos", returnType: "Double")
      }

      it("generates function") {
        expect(function.code(indent: 0)).to.eq("public func cos() -> Double {\n}\n")
      }
    }

    context("with body") {
      before {
        function = AST.Function(name: "cos", returnType: "Double")
        function.children.append(AST.CodeLine(line: "return 1.0"))
      }

      it("generates function") {
        expect(function.code(indent: 0)).to.eq("public func cos() -> Double {\n  return 1.0\n}\n")
      }
    }
  }
}
