import SSpec
import AST

func simpleTypeSpec() {
  describe("AST.SimpleType") {
    var simpleType: AST.SimpleType!

    before {
      simpleType = AST.SimpleType(name: "Tensor")
    }

    describe("#typeName") {
      context("no generics") {
        it("returns name") {
          expect(simpleType.typeName()).to.eq("Tensor")
        }
      }

      context("one generic") {
        before {
          simpleType.generics.append(AST.GenericType(name: "T"))
        }

        it("returns name with generic") {
          expect(simpleType.typeName()).to.eq("Tensor<T>")
        }
      }

      context("two generics") {
        before {
          simpleType.generics.append(AST.GenericType(name: "A"))
          simpleType.generics.append(AST.GenericType(name: "B"))
        }

        it("returns name with generics") {
          expect(simpleType.typeName()).to.eq("Tensor<A, B>")
        }
      }
    }
  }
}
