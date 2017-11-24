extension AST {
  public class DocComment: AST.BaseNode {
    public let text: String;

    public init(text: String) {
      self.text = text;
    }

    override public func code(indent: Int) -> String {
      let indention = indentionString(indent: indent)
      let starts = "///"
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
