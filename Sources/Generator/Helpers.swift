import AST

let defaultPath = "Sources/SwanKit-Generated"

func createSourceFile(name: String, path: String = defaultPath, block: (AST.SourceFile) -> Void) {
  let src = AST.SourceFile(path: "Sources/SwanKit-Generated", name: name)
  block(src)
  try! src.generate()
}

extension AST.ParentNode {
  func empty() {
    children.append(AST.EmptyLine())
  }

  func line(_ line: String) {
    children.append(AST.CodeLine(line: line))
  }

  func comment(_ text: String) {
    children.append(AST.Comment(text: text))
  }

  func docComment(_ text: String) {
    children.append(AST.Comment(text: text, isDocument: true))
  }

  func typeExtension(_ type: String, _ whereClause: String, block: (AST.Extension) -> Void) {
    let ext = AST.Extension(type: type)
    ext.whereClause = whereClause
    children.append(ext)
    block(ext)
  }
}
