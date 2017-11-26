extension AST {
  public class CodeLine: BaseNode {
    public let line: String;

    public init(line: String) {
      self.line = line;
    }

    override public func code(indent: Int) -> String {
      var lineOfCode = indentionString(indent: indent)
      lineOfCode.append(line)
      lineOfCode.append("\n")
      return lineOfCode
    }
  }
}
