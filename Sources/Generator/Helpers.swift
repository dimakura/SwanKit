import AST

func createSourceFile(name: String, path: String, block: (AST.SourceFile) -> Void) {
  let src = AST.SourceFile(path: path, name: name)
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
    children.append(AST.Comment(text: text, isDocumentation: true))
  }

  func typeExtension(_ type: String, _ whereClause: String, block: (AST.Extension) -> Void) {
    let ext = AST.Extension(type: type)
    ext.whereClause = whereClause
    children.append(ext)
    block(ext)
  }

  func function(_ name: String, _ returnType: String? = nil, block: (AST.Function) -> Void) {
    let function = AST.Function(name: name, returnType: returnType)
    children.append(function)
    block(function)
  }
}
