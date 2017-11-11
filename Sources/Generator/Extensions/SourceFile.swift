import AST
import Foundation

extension AST.SourceFile {
  func save() -> Bool {
    do {
      let url = URL(fileURLWithPath: path)
      try code(indent: 0).write(to: url, atomically: true, encoding: .utf8)
      return true
    } catch {
      return false
    }
  }

  func comment(_ text: String) {
    children.append(AST.Comment(text: text))
  }

  func packageImport(_ packageName: String) {
    let package = AST.Package(name: packageName)
    children.append(AST.ImportStatement(package: package))
  }

  func emptyLine() {
    emptyLines(1)
  }

  func emptyLines(_ lines: Int) {
    children.append(AST.EmptyLine(lines: lines))
  }
}
