extension AST {
  public class ClassExtension: BaseNode, ASTSourceFileChild {
    public let subject: Class
    public var constraint: TypeConstraint?

    public init(subject: Class) {
      self.subject = subject
    }

    override public func code(indent: Int) -> String {
      let indention = indentionString(indent: indent)
      var source = indention
      source.append("extension ")
      source.append(subject.typeName())
      source.append(" ")
      if let c = constraint {
        source.append("where ")
        source.append(c.description)
        source.append(" ")
      }
      source.append("{\n")
      // TODO: body here with indent + 1
      source.append(indention)
      source.append("}")
      return source
    }
  }
}
