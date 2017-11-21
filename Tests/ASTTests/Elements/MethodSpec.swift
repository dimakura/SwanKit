import SSpec
import AST

func methodSpec() {
  describe("AST.Method") {
    var method: AST.Method!

    before {
      method = AST.Method(name: "cos")
    }

    describe("#signature") {
      context("without return type") {
        it("generates signature") {
          expect(method.signature).to.eq("func cos()")
        }
      }

      context("with return type") {
        before {
          method.returnType = AST.SimpleType(name: "Double")
        }

        it("generates signature") {
          expect(method.signature).to.eq("func cos() -> Double")
        }
      }
    }
  }
}
