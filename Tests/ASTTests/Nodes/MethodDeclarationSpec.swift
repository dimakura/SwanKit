import SSpec
import AST

func methodDeclarationSpec() {
  describe("AST.MethodDeclaration") {
    let method = AST.Method(name: "cos")
    var methodDeclaration: AST.MethodDeclaration!

    before {
      let body = AST.MethodBody()
      methodDeclaration = AST.MethodDeclaration(method: method, body: body)
    }

    context("default visibility") {
      it("generates method") {
        expect(methodDeclaration.code(indent: 0)).to.eq("func cos() {}")
        expect(methodDeclaration.code(indent: 1)).to.eq("  func cos() {}")
      }
    }

    context("public method") {
      before {
        method.visibility = .Public
      }

      it("generates method") {
        expect(methodDeclaration.code(indent: 0)).to.eq("public func cos() {}")
        expect(methodDeclaration.code(indent: 1)).to.eq("  public func cos() {}")
      }
    }
  }
}
