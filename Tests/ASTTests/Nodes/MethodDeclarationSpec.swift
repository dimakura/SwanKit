import SSpec
import AST

func methodDeclarationSpec() {
  describe("AST.MethodDeclaration") {
    var methodDeclaration: AST.MethodDeclaration!

    before {
      let method = AST.Method(name: "cos")
      method.visibility = .Public
      let body = AST.MethodBody()
      methodDeclaration = AST.MethodDeclaration(method: method, body: body)
    }

    context("empty body") {
      it("generates method") {
        expect(methodDeclaration.code(indent: 0)).to.eq("public func cos() {}")
        expect(methodDeclaration.code(indent: 1)).to.eq("  public func cos() {}")
      }
    }
  }
}
