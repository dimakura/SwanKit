import SSpec
import AST

func parameterSpec() {
  describe("AST.Parameter") {
    let type = AST.SimpleType(name: "String")
    var parameter: AST.Parameter!

    context("no external name") {
      before {
        parameter = AST.Parameter(name: "name", type: type)
      }

      it("generates declaration") {
        expect(parameter.declaration).to.eq("name: String")
      }
    }

    context("has external name") {
      before {
        parameter = AST.Parameter(externalName: "_", name: "name", type: type)
      }

      it("generates declaration") {
        expect(parameter.declaration).to.eq("_ name: String")
      }
    }
  }
}
