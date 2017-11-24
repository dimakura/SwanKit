extension AST {
  public class Comment: BaseNode, ASTSourceFileChild, ASTClassExtensionChild {
    public enum Kind {
      case Default
      case Document

      public var startsWith: String {
        switch self {
        case .Default:
          return "//"
        case .Document:
          return "///"
        }
      }
    }

    public let text: String
    public let kind: Kind

    public init(text: String, kind: Kind = .Default) {
      self.text = text
      self.kind = kind
    }

    override public func code(indent: Int) -> String {
      let indention = indentionString(indent: indent)
      let starts = kind.startsWith
      var comment = ""
      var first = true
      for line in text.split(separator: "\n") {
        if first {
          first = false
        } else {
          comment.append("\n")
        }
        comment.append(indention)
        comment.append(starts)
        comment.append(" ")
        comment.append(String(line))
      }
      return comment
    }
  }
}
