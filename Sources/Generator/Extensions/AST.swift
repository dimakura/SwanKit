import AST

extension AST {
  static func createFile(_ path: String, _ body: (SourceFile) -> Void) -> Bool {
    let sourceFile = SourceFile(path: path)
    body(sourceFile)
    return sourceFile.save()
  }

  static func describeClass(_ name: String) -> AST.Class {
    let subject = AST.Class(name: name)
    return subject
  }
}
