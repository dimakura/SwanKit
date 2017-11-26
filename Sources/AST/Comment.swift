extension AST {
  public class Comment: BaseNode {
    public let text: String;
    public let isDocument: Bool

    public init(text: String, isDocument: Bool = false) {
      self.text = text
      self.isDocument = isDocument
    }

    override public func code(indent: Int) -> String {
      let indention = indentionString(indent: indent)
      let starts = isDocument ? "///" : "//"
      var comment = ""
      for line in text.split(separator: "\n") {
        comment.append(indention)
        comment.append(starts)
        comment.append(" ")
        comment.append(String(line))
        comment.append("\n")
      }
      return comment
    }
  }
}
