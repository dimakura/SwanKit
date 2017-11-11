import SSpec
import AST

func typeConstraintSpec() {
  describe("AST.TypeConstraint") {
    let doubleClass = AST.Class(name: "Double")
    let generic = AST.GenericType(name: "T")
    let constraint = AST.TypeConstraint.Equality(generic, doubleClass)

    describe("#description") {
      it("compares generic with AST type") {
        expect(constraint.description).to.eq("T == Double")
      }
    }
  }
}
