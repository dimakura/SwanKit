import AST

extension AST {
  static func createFile(_ path: String, _ body: (SourceFile) -> Void) -> Bool {
    let sourceFile = SourceFile(path: path)
    body(sourceFile)
    return sourceFile.save()
  }

  static func describeClass(_ name: String, _ body: (AST.Class) -> Void) -> AST.Class {
    let subject = AST.Class(name: name)
    body(subject)
    return subject
  }
}
