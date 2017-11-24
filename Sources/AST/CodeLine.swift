extension AST {
  public class CodeLine: AST.BaseNode {
    public let line: String;

    public init(line: String) {
      self.line = line;
    }

    override public func code(indent: Int) -> String {
      var lineOfCode = indentionString(indent: indent)
      lineOfCode.append(line)
      return lineOfCode
    }
  }
}
