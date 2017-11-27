import Foundation

extension AST {
  public class SourceFile: ParentNode {
    public var path: String
    public var name: String

    public init(path: String, name: String) {
      self.path = path
      self.name = name
    }

    override public func code(indent: Int) -> String {
      return code(nodes: children, indent: indent)
    }

    public func generate() throws {
      let url = URL(fileURLWithPath: path + "/" + name + ".swift")
      try code(indent: 0).write(to: url, atomically: true, encoding: .utf8)
    }
  }
}
