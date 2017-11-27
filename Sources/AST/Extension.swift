extension AST {
  public class Extension: ParentNode {
    public let type: String;
    public var whereClause: String? = nil;

    public init(type: String) {
      self.type = type;
    }

    override public func code(indent: Int) -> String {
      let indention = indentionString(indent: indent);
      var ext = indention
      ext.append("extension ")
      ext.append(type)
      ext.append(" ")
      if let w = whereClause {
        ext.append("where ")
        ext.append(w)
        ext.append(" ")
      }
      ext.append("{\n")
      ext.append(code(nodes: children, indent: indent + 1))
      ext.append(indention);
      ext.append("}\n")
      return ext;
    }
  }
}
