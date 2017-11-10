import Foundation

public struct AST {
  func createFile(_ path: String, _ body: (SourceFile) -> Void) -> Bool {
    do {
      let sourceFile = SourceFile(path: path)
      body(sourceFile)
      let code = sourceFile.code(indent: 0)
      let url = URL(fileURLWithPath: sourceFile.path)
      try code.write(to: url, atomically: true, encoding: .utf8)
      return true
    } catch {
      return false
    }
  }
}
