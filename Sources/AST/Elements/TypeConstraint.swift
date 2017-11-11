extension AST {
  public enum TypeConstraint: CustomStringConvertible {
    case Equality(GenericType, ASTType)

    public var description: String {
      switch self {
      case let .Equality(generic, type):
        return generic.name + " == " + type.typeName()
      }
    }
  }
}
