import SSpec
import AST

func functionDeclarationSpec() {
  describe("AST.FunctionDeclaration") {
    let function = AST.Function(name: "cos")
    var functionDeclaration: AST.FunctionDeclaration!

    before {
      let body = AST.FunctionBody()
      functionDeclaration = AST.FunctionDeclaration(function: function, body: body)
    }

    context("default visibility") {
      it("generates function") {
        expect(functionDeclaration.code(indent: 0)).to.eq("func cos() {}")
        expect(functionDeclaration.code(indent: 1)).to.eq("  func cos() {}")
      }
    }

    context("public function") {
      before {
        function.visibility = .Public
      }

      it("generates function") {
        expect(functionDeclaration.code(indent: 0)).to.eq("public func cos() {}")
        expect(functionDeclaration.code(indent: 1)).to.eq("  public func cos() {}")
      }
    }
  }
}
