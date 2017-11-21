import SSpec
import AST

func functionSpec() {
  describe("AST.Function") {
    var function: AST.Function!

    before {
      function = AST.Function(name: "cos")
    }

    describe("#signature") {
      context("without return type") {
        it("generates signature") {
          expect(function.signature).to.eq("func cos()")
        }
      }

      context("with return type") {
        before {
          function.returnType = AST.SimpleType(name: "Double")
        }

        it("generates signature") {
          expect(function.signature).to.eq("func cos() -> Double")
        }
      }

      context("with parameters") {
        before {
          function.returnType = AST.SimpleType(name: "Double")
          function.parameters.append(AST.Parameter(name: "angle", type: AST.SimpleType(name: "Double")))
        }

        it("generates signature") {
          expect(function.signature).to.eq("func cos(angle: Double) -> Double")
        }
      }
    }
  }
}
