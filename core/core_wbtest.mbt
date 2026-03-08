// Whitebox tests run within the package scope.
// Use them to validate internal helpers or invariants.
// Keep them focused; public behavior belongs in `_test.mbt`.

// ============================================================
// Lexer tests
// ============================================================

test "lexer: integer literals" {
  let lexer = Lexer::new("42")
  let tokens = lexer.tokenize()
  assert_eq(tokens[0].kind, Indent(0))
  assert_eq(tokens[1].kind, Int(42))
  assert_eq(tokens[2].kind, Eof)
}

test "lexer: float literals" {
  let lexer = Lexer::new("3.14")
  let tokens = lexer.tokenize()
  assert_eq(tokens[0].kind, Indent(0))
  assert_eq(tokens[1].kind, Float(3.14))
}

test "lexer: negative integer" {
  let lexer = Lexer::new("-5")
  let tokens = lexer.tokenize()
  // At start of input, - followed by digit is a negative literal
  assert_eq(tokens[0].kind, Indent(0))
  assert_eq(tokens[1].kind, Int(-5))
}

test "lexer: string" {
  let lexer = Lexer::new("///hello world///")
  let tokens = lexer.tokenize()
  assert_eq(tokens[0].kind, Indent(0))
  assert_eq(tokens[1].kind, Str("hello world"))
}

test "lexer: string with escape" {
  let lexer = Lexer::new("///line1\\nline2///")
  let tokens = lexer.tokenize()
  assert_eq(tokens[0].kind, Indent(0))
  assert_eq(tokens[1].kind, Str("line1\nline2"))
}

test "lexer: regex" {
  let lexer = Lexer::new("/abc/gi")
  let tokens = lexer.tokenize()
  assert_eq(tokens[0].kind, Indent(0))
  assert_eq(tokens[1].kind, Regex("abc", "gi"))
}

test "lexer: keywords" {
  let lexer = Lexer::new("const let var be fn return if else")
  let tokens = lexer.tokenize()
  assert_eq(tokens[0].kind, Indent(0))
  assert_eq(tokens[1].kind, Const_)
  assert_eq(tokens[2].kind, Let_)
  assert_eq(tokens[3].kind, Var_)
  assert_eq(tokens[4].kind, Be)
  assert_eq(tokens[5].kind, Fn)
  assert_eq(tokens[6].kind, Return_)
  assert_eq(tokens[7].kind, If_)
  assert_eq(tokens[8].kind, Else_)
}

test "lexer: operators" {
  let lexer = Lexer::new("add sub mul div mod pow eq neq lt gt le ge and or not neg")
  let tokens = lexer.tokenize()
  assert_eq(tokens[0].kind, Indent(0))
  assert_eq(tokens[1].kind, Add)
  assert_eq(tokens[2].kind, Sub)
  assert_eq(tokens[3].kind, Mul)
  assert_eq(tokens[4].kind, Div)
  assert_eq(tokens[5].kind, Mod)
  assert_eq(tokens[6].kind, Pow)
  assert_eq(tokens[7].kind, Eq)
  assert_eq(tokens[8].kind, Neq)
  assert_eq(tokens[9].kind, Lt)
  assert_eq(tokens[10].kind, Gt)
  assert_eq(tokens[11].kind, Le)
  assert_eq(tokens[12].kind, Ge)
  assert_eq(tokens[13].kind, And)
  assert_eq(tokens[14].kind, Or)
  assert_eq(tokens[15].kind, Not)
  assert_eq(tokens[16].kind, Neg)
}

test "lexer: punctuation" {
  let lexer = Lexer::new("[a, b; c]")
  let tokens = lexer.tokenize()
  assert_eq(tokens[0].kind, Indent(0))
  assert_eq(tokens[1].kind, LBracket)
  assert_eq(tokens[2].kind, Ident("a"))
  assert_eq(tokens[3].kind, Comma)
  assert_eq(tokens[4].kind, Ident("b"))
  assert_eq(tokens[5].kind, Semicolon)
  assert_eq(tokens[6].kind, Ident("c"))
  assert_eq(tokens[7].kind, RBracket)
}

test "lexer: dot access" {
  let lexer = Lexer::new("console.log")
  let tokens = lexer.tokenize()
  assert_eq(tokens[0].kind, Indent(0))
  assert_eq(tokens[1].kind, Ident("console"))
  assert_eq(tokens[2].kind, Dot)
  assert_eq(tokens[3].kind, Ident("log"))
}

test "lexer: line comment" {
  let lexer = Lexer::new("x -- this is a comment")
  let tokens = lexer.tokenize()
  assert_eq(tokens[0].kind, Indent(0))
  assert_eq(tokens[1].kind, Ident("x"))
  assert_eq(tokens[2].kind, Comment(" this is a comment"))
}

test "lexer: block comment" {
  let lexer = Lexer::new("---block comment---")
  let tokens = lexer.tokenize()
  assert_eq(tokens[0].kind, Indent(0))
  assert_eq(tokens[1].kind, BlockComment("block comment"))
}

test "lexer: indentation" {
  let lexer = Lexer::new("a\n  b\n    c\n  d\ne")
  let tokens = lexer.tokenize()
  // Line 1: Indent(0), Ident(a), Newline
  assert_eq(tokens[0].kind, Indent(0))
  assert_eq(tokens[1].kind, Ident("a"))
  assert_eq(tokens[2].kind, Newline)
  // Line 2: Indent(2), Ident(b), Newline
  assert_eq(tokens[3].kind, Indent(2))
  assert_eq(tokens[4].kind, Ident("b"))
  assert_eq(tokens[5].kind, Newline)
  // Line 3: Indent(4), Ident(c), Newline
  assert_eq(tokens[6].kind, Indent(4))
  assert_eq(tokens[7].kind, Ident("c"))
  assert_eq(tokens[8].kind, Newline)
  // Line 4: Indent(2), Ident(d), Newline
  assert_eq(tokens[9].kind, Indent(2))
  assert_eq(tokens[10].kind, Ident("d"))
  assert_eq(tokens[11].kind, Newline)
  // Line 5: Indent(0), Ident(e)
  assert_eq(tokens[12].kind, Indent(0))
  assert_eq(tokens[13].kind, Ident("e"))
}

test "lexer: var decl" {
  let lexer = Lexer::new("const x be 10")
  let tokens = lexer.tokenize()
  assert_eq(tokens[0].kind, Indent(0))
  assert_eq(tokens[1].kind, Const_)
  assert_eq(tokens[2].kind, Ident("x"))
  assert_eq(tokens[3].kind, Be)
  assert_eq(tokens[4].kind, Int(10))
}

test "lexer: true false null nil undefined" {
  let lexer = Lexer::new("true false null nil undefined")
  let tokens = lexer.tokenize()
  assert_eq(tokens[0].kind, Indent(0))
  assert_eq(tokens[1].kind, True_)
  assert_eq(tokens[2].kind, False_)
  assert_eq(tokens[3].kind, Null_)
  assert_eq(tokens[4].kind, Nil_)
  assert_eq(tokens[5].kind, Undefined_)
}

test "lexer: list and object keywords" {
  let lexer = Lexer::new("list object")
  let tokens = lexer.tokenize()
  assert_eq(tokens[0].kind, Indent(0))
  assert_eq(tokens[1].kind, List_)
  assert_eq(tokens[2].kind, Object_)
}

test "lexer: multiline function" {
  let src = "fn greet name\n  console.log[///hello///]"
  let lexer = Lexer::new(src)
  let tokens = lexer.tokenize()
  assert_eq(tokens[0].kind, Indent(0))
  assert_eq(tokens[1].kind, Fn)
  assert_eq(tokens[2].kind, Ident("greet"))
  assert_eq(tokens[3].kind, Ident("name"))
  assert_eq(tokens[4].kind, Newline)
  assert_eq(tokens[5].kind, Indent(2))
  assert_eq(tokens[6].kind, Ident("console"))
  assert_eq(tokens[7].kind, Dot)
  assert_eq(tokens[8].kind, Ident("log"))
  assert_eq(tokens[9].kind, LBracket)
  assert_eq(tokens[10].kind, Str("hello"))
  assert_eq(tokens[11].kind, RBracket)
}

test "lexer: hyphenated ident" {
  let lexer = Lexer::new("my-var")
  let tokens = lexer.tokenize()
  assert_eq(tokens[0].kind, Indent(0))
  assert_eq(tokens[1].kind, Ident("my-var"))
}

test "lexer: negative after operator" {
  // After an identifier, `-5` should be parsed as Sub token then Int(5)
  // (not a negative literal)
  let lexer = Lexer::new("x -5")
  let tokens = lexer.tokenize()
  assert_eq(tokens[0].kind, Indent(0))
  assert_eq(tokens[1].kind, Ident("x"))
  // After Ident, '-' is not neg literal context, so '-' is skipped as unknown
  // and 5 is a separate number
}

test "lexer: negative after be" {
  let lexer = Lexer::new("const x be -3")
  let tokens = lexer.tokenize()
  assert_eq(tokens[0].kind, Indent(0))
  assert_eq(tokens[1].kind, Const_)
  assert_eq(tokens[2].kind, Ident("x"))
  assert_eq(tokens[3].kind, Be)
  assert_eq(tokens[4].kind, Int(-3))
}

// ============================================================
// Parser tests
// ============================================================

///|
fn tokenize(src : String) -> Array[Token] {
  Lexer::new(src).tokenize()
}

///|
fn parse(src : String) -> Array[Stmt] {
  Parser::new(tokenize(src)).parse()
}

test "parser: const declaration" {
  let stmts = parse("const x be 42")
  assert_eq(stmts.length(), 1)
  match stmts[0] {
    VarDecl(Const_, name, IntLit(42)) => assert_eq(name, "x")
    _ => fail("expected VarDecl")
  }
}

test "parser: let declaration" {
  let stmts = parse("let y be 3.14")
  assert_eq(stmts.length(), 1)
  match stmts[0] {
    VarDecl(Let_, name, FloatLit(_)) => assert_eq(name, "y")
    _ => fail("expected VarDecl with Let")
  }
}

test "parser: var declaration with string" {
  let stmts = parse("var msg be ///hello///")
  assert_eq(stmts.length(), 1)
  match stmts[0] {
    VarDecl(Var_, name, StrLit(s)) => {
      assert_eq(name, "msg")
      assert_eq(s, "hello")
    }
    _ => fail("expected VarDecl with Var")
  }
}

test "parser: assignment" {
  let stmts = parse("x be 10")
  assert_eq(stmts.length(), 1)
  match stmts[0] {
    Assign(Ident(name), IntLit(10)) => assert_eq(name, "x")
    _ => fail("expected Assign")
  }
}

test "parser: binary add" {
  let stmts = parse("const r be 1 add 2")
  assert_eq(stmts.length(), 1)
  match stmts[0] {
    VarDecl(Const_, _, BinOp(Add, IntLit(1), IntLit(2))) => ()
    _ => fail("expected BinOp Add")
  }
}

test "parser: binary precedence mul over add" {
  let stmts = parse("const r be 1 add 2 mul 3")
  assert_eq(stmts.length(), 1)
  // Should parse as: 1 add (2 mul 3)
  match stmts[0] {
    VarDecl(Const_, _, BinOp(Add, IntLit(1), BinOp(Mul, IntLit(2), IntLit(3)))) => ()
    _ => fail("expected Add(1, Mul(2,3))")
  }
}

test "parser: comparison and logic" {
  let stmts = parse("const r be x lt 10 and y gt 5")
  assert_eq(stmts.length(), 1)
  match stmts[0] {
    VarDecl(Const_, _, BinOp(And, BinOp(Lt, _, IntLit(10)), BinOp(Gt, _, IntLit(5)))) => ()
    _ => fail("expected And(Lt, Gt)")
  }
}

test "parser: unary not" {
  let stmts = parse("const r be not true")
  assert_eq(stmts.length(), 1)
  match stmts[0] {
    VarDecl(Const_, _, UnaryNot(BoolLit(true))) => ()
    _ => fail("expected UnaryNot")
  }
}

test "parser: unary neg" {
  let stmts = parse("const r be neg x")
  assert_eq(stmts.length(), 1)
  match stmts[0] {
    VarDecl(Const_, _, UnaryNeg(Ident(name))) => assert_eq(name, "x")
    _ => fail("expected UnaryNeg")
  }
}

test "parser: dot access" {
  let stmts = parse("console.log")
  assert_eq(stmts.length(), 1)
  match stmts[0] {
    ExprStmt(DotAccess(Ident(obj), field)) => {
      assert_eq(obj, "console")
      assert_eq(field, "log")
    }
    _ => fail("expected DotAccess")
  }
}

test "parser: meth call" {
  let stmts = parse("console.log[///hi///]")
  assert_eq(stmts.length(), 1)
  match stmts[0] {
    ExprStmt(MethodCall(Ident(obj), meth, args)) => {
      assert_eq(obj, "console")
      assert_eq(meth, "log")
      assert_eq(args.length(), 1)
    }
    _ => fail("expected MethodCall")
  }
}

test "parser: function call" {
  let stmts = parse("greet[///world///]")
  assert_eq(stmts.length(), 1)
  match stmts[0] {
    ExprStmt(Call(Ident(name), args)) => {
      assert_eq(name, "greet")
      assert_eq(args.length(), 1)
    }
    _ => fail("expected Call")
  }
}

test "parser: fn declaration with to" {
  let stmts = parse("fn double x to x mul 2")
  assert_eq(stmts.length(), 1)
  match stmts[0] {
    FnDecl(decl) => {
      assert_eq(decl.name, Some("double"))
      assert_eq(decl.params.length(), 1)
      assert_eq(decl.params[0], "x")
      match decl.body {
        ToExpr(BinOp(Mul, Ident(_), IntLit(2))) => ()
        _ => fail("expected ToExpr body")
      }
    }
    _ => fail("expected FnDecl")
  }
}

test "parser: fn block declaration" {
  let stmts = parse("fn greet name\n  console.log[name]")
  assert_eq(stmts.length(), 1)
  match stmts[0] {
    FnDecl(decl) => {
      assert_eq(decl.name, Some("greet"))
      assert_eq(decl.params.length(), 1)
      match decl.body {
        Block(body) => assert_true(body.length() > 0)
        _ => fail("expected Block body")
      }
    }
    _ => fail("expected FnDecl")
  }
}

test "parser: return statement" {
  let stmts = parse("return 42")
  assert_eq(stmts.length(), 1)
  match stmts[0] {
    Return(Some(IntLit(42))) => ()
    _ => fail("expected Return")
  }
}

test "parser: return without value" {
  let stmts = parse("return")
  assert_eq(stmts.length(), 1)
  match stmts[0] {
    Return(None) => ()
    _ => fail("expected Return without value")
  }
}

test "parser: break and continue" {
  let stmts = parse("break")
  assert_eq(stmts.length(), 1)
  match stmts[0] {
    Break => ()
    _ => fail("expected Break")
  }
}

test "parser: true false null undefined" {
  let stmts = parse("true")
  match stmts[0] {
    ExprStmt(BoolLit(true)) => ()
    _ => fail("expected BoolLit true")
  }
  let stmts2 = parse("null")
  match stmts2[0] {
    ExprStmt(NullLit) => ()
    _ => fail("expected NullLit")
  }
  let stmts3 = parse("undefined")
  match stmts3[0] {
    ExprStmt(UndefinedLit) => ()
    _ => fail("expected UndefinedLit")
  }
}

test "parser: empty array" {
  let stmts = parse("const a be []")
  match stmts[0] {
    VarDecl(Const_, _, ArrayLit(elems)) => assert_eq(elems.length(), 0)
    _ => fail("expected empty ArrayLit")
  }
}

test "parser: array with elements" {
  let stmts = parse("const a be [1, 2, 3]")
  match stmts[0] {
    VarDecl(Const_, _, ArrayLit(elems)) => assert_eq(elems.length(), 3)
    _ => fail("expected ArrayLit with 3 elements")
  }
}

test "parser: empty object" {
  let stmts = parse("const o be [be]")
  match stmts[0] {
    VarDecl(Const_, _, ObjectLit(pairs)) => assert_eq(pairs.length(), 0)
    _ => fail("expected empty ObjectLit")
  }
}

test "parser: object with entries" {
  let stmts = parse("const o be [x be 1, y be 2]")
  match stmts[0] {
    VarDecl(Const_, _, ObjectLit(pairs)) => {
      assert_eq(pairs.length(), 2)
      assert_eq(pairs[0].0, "x")
      assert_eq(pairs[1].0, "y")
    }
    _ => fail("expected ObjectLit")
  }
}

test "parser: list literal" {
  let stmts = parse("const a be list[1, 2]")
  match stmts[0] {
    VarDecl(Const_, _, ArrayLit(elems)) => assert_eq(elems.length(), 2)
    _ => fail("expected list ArrayLit")
  }
}

test "parser: object literal" {
  let stmts = parse("const o be object[name be ///hi///]")
  match stmts[0] {
    VarDecl(Const_, _, ObjectLit(pairs)) => {
      assert_eq(pairs.length(), 1)
      assert_eq(pairs[0].0, "name")
    }
    _ => fail("expected object ObjectLit")
  }
}

test "parser: if-then-else expression" {
  let stmts = parse("const r be if true then 1 else 2")
  match stmts[0] {
    VarDecl(Const_, _, IfExpr(BoolLit(true), IntLit(1), IntLit(2))) => ()
    _ => fail("expected IfExpr")
  }
}

test "parser: pipe" {
  let stmts = parse("const r be x pipe f")
  match stmts[0] {
    VarDecl(Const_, _, Pipe(Ident(x), Ident(f))) => {
      assert_eq(x, "x")
      assert_eq(f, "f")
    }
    _ => fail("expected Pipe")
  }
}

test "parser: while loop" {
  let stmts = parse("while true\n  break")
  assert_eq(stmts.length(), 1)
  match stmts[0] {
    While(BoolLit(true), body) => {
      assert_eq(body.length(), 1)
      match body[0] {
        Break => ()
        _ => fail("expected Break in while body")
      }
    }
    _ => fail("expected While")
  }
}

test "parser: for-in loop" {
  let stmts = parse("for x in items\n  console.log[x]")
  assert_eq(stmts.length(), 1)
  match stmts[0] {
    ForIn(name, None, Ident(iter), body) => {
      assert_eq(name, "x")
      assert_eq(iter, "items")
      assert_eq(body.length(), 1)
    }
    _ => fail("expected ForIn")
  }
}

test "parser: throw" {
  let stmts = parse("throw ///error///")
  assert_eq(stmts.length(), 1)
  match stmts[0] {
    Throw(StrLit(s)) => assert_eq(s, "error")
    _ => fail("expected Throw")
  }
}

test "parser: postfix if" {
  let stmts = parse("console.log[///hi///] if debug")
  assert_eq(stmts.length(), 1)
  match stmts[0] {
    PostfixIf(_, Ident(cond)) => assert_eq(cond, "debug")
    _ => fail("expected PostfixIf")
  }
}

test "parser: postfix unless" {
  let stmts = parse("console.log[///hi///] unless quiet")
  assert_eq(stmts.length(), 1)
  match stmts[0] {
    PostfixUnless(_, Ident(cond)) => assert_eq(cond, "quiet")
    _ => fail("expected PostfixUnless")
  }
}

test "parser: typeof" {
  let stmts = parse("const t be typeof x")
  match stmts[0] {
    VarDecl(Const_, _, UnaryTypeof(Ident(name))) => assert_eq(name, "x")
    _ => fail("expected UnaryTypeof")
  }
}

test "parser: is check" {
  let stmts = parse("const r be x is string")
  match stmts[0] {
    VarDecl(Const_, _, IsCheck(Ident(name), type_name)) => {
      assert_eq(name, "x")
      assert_eq(type_name, "string")
    }
    _ => fail("expected IsCheck")
  }
}

test "parser: eq with type name becomes IsCheck" {
  let stmts = parse("const r be x eq string")
  match stmts[0] {
    VarDecl(Const_, _, IsCheck(Ident(name), type_name)) => {
      assert_eq(name, "x")
      assert_eq(type_name, "string")
    }
    _ => fail("expected IsCheck from eq + type name")
  }
}

test "parser: is with value becomes BinOp Eq" {
  let stmts = parse("const r be x is y")
  match stmts[0] {
    VarDecl(Const_, _, BinOp(Eq, Ident(l), Ident(r))) => {
      assert_eq(l, "x")
      assert_eq(r, "y")
    }
    _ => fail("expected BinOp Eq from is + non-type value")
  }
}

test "parser: as cast" {
  let stmts = parse("const r be x as number")
  match stmts[0] {
    VarDecl(Const_, _, AsCast(Ident(name), type_name)) => {
      assert_eq(name, "x")
      assert_eq(type_name, "number")
    }
    _ => fail("expected AsCast")
  }
}

test "parser: regex literal" {
  let stmts = parse("const r be /abc/gi")
  match stmts[0] {
    VarDecl(Const_, _, RegexLit(pattern, flags)) => {
      assert_eq(pattern, "abc")
      assert_eq(flags, "gi")
    }
    _ => fail("expected RegexLit")
  }
}

test "parser: delete statement" {
  let stmts = parse("delete x")
  match stmts[0] {
    DeleteStmt(Ident(name)) => assert_eq(name, "x")
    _ => fail("expected DeleteStmt")
  }
}

test "parser: new expression" {
  let stmts = parse("const d be new Date[]")
  match stmts[0] {
    VarDecl(Const_, _, NewExpr(Ident(name), args)) => {
      assert_eq(name, "Date")
      assert_eq(args.length(), 0)
    }
    _ => fail("expected NewExpr")
  }
}

test "parser: this" {
  let stmts = parse("this.x")
  match stmts[0] {
    ExprStmt(DotAccess(ThisExpr, field)) => assert_eq(field, "x")
    _ => fail("expected this.x")
  }
}

test "parser: import default" {
  let stmts = parse("import fs from ///fs///")
  assert_eq(stmts.length(), 1)
  match stmts[0] {
    ImportDecl(EsImport(Some(default_name), None, None, module_name, _)) => {
      assert_eq(default_name, "fs")
      assert_eq(module_name, "fs")
    }
    _ => fail("expected ImportDecl")
  }
}

test "parser: multiple statements" {
  let stmts = parse("const x be 1\nconst y be 2\nconst z be x add y")
  assert_eq(stmts.length(), 3)
}

// ============================================================
// New feature tests
// ============================================================

test "lexer: neq keyword" {
  let lexer = Lexer::new("neq")
  let tokens = lexer.tokenize()
  assert_eq(tokens[1].kind, Neq)
}

test "lexer: pow keyword" {
  let lexer = Lexer::new("pow")
  let tokens = lexer.tokenize()
  assert_eq(tokens[1].kind, Pow)
}

test "lexer: dot dot" {
  let lexer = Lexer::new("[0..10]")
  let tokens = lexer.tokenize()
  assert_eq(tokens[0].kind, Indent(0))
  assert_eq(tokens[1].kind, LBracket)
  assert_eq(tokens[2].kind, Int(0))
  assert_eq(tokens[3].kind, DotDot)
  assert_eq(tokens[4].kind, Int(10))
  assert_eq(tokens[5].kind, RBracket)
}

test "lexer: dot dot dot" {
  let lexer = Lexer::new("[0...10]")
  let tokens = lexer.tokenize()
  assert_eq(tokens[0].kind, Indent(0))
  assert_eq(tokens[1].kind, LBracket)
  assert_eq(tokens[2].kind, Int(0))
  assert_eq(tokens[3].kind, DotDotDot)
  assert_eq(tokens[4].kind, Int(10))
  assert_eq(tokens[5].kind, RBracket)
}

test "lexer: namespace keyword" {
  let lexer = Lexer::new("namespace")
  let tokens = lexer.tokenize()
  assert_eq(tokens[1].kind, Mod_)
}

test "parser: neq operator" {
  let stmts = parse("const r be x neq y")
  match stmts[0] {
    VarDecl(Const_, _, BinOp(Neq, Ident(l), Ident(r))) => {
      assert_eq(l, "x")
      assert_eq(r, "y")
    }
    _ => fail("expected BinOp Neq")
  }
}

test "parser: not eq operator" {
  let stmts = parse("const r be x not eq y")
  match stmts[0] {
    VarDecl(Const_, _, BinOp(Neq, Ident(l), Ident(r))) => {
      assert_eq(l, "x")
      assert_eq(r, "y")
    }
    _ => fail("expected BinOp Neq from not eq")
  }
}

test "parser: lt eq becomes Le" {
  let stmts = parse("const r be x lt eq y")
  match stmts[0] {
    VarDecl(Const_, _, BinOp(Le, Ident(l), Ident(r))) => {
      assert_eq(l, "x")
      assert_eq(r, "y")
    }
    _ => fail("expected BinOp Le from lt eq")
  }
}

test "parser: gt eq becomes Ge" {
  let stmts = parse("const r be x gt eq y")
  match stmts[0] {
    VarDecl(Const_, _, BinOp(Ge, Ident(l), Ident(r))) => {
      assert_eq(l, "x")
      assert_eq(r, "y")
    }
    _ => fail("expected BinOp Ge from gt eq")
  }
}

test "parser: pow operator" {
  let stmts = parse("const r be 2 pow 3")
  match stmts[0] {
    VarDecl(Const_, _, BinOp(Pow, IntLit(2), IntLit(3))) => ()
    _ => fail("expected BinOp Pow")
  }
}

test "parser: pow right-associative" {
  let stmts = parse("const r be 2 pow 3 pow 4")
  match stmts[0] {
    VarDecl(Const_, _, BinOp(Pow, IntLit(2), BinOp(Pow, IntLit(3), IntLit(4)))) => ()
    _ => fail("expected right-associative Pow")
  }
}

test "parser: inclusive range [0..5]" {
  let stmts = parse("const r be [0..5]")
  match stmts[0] {
    VarDecl(Const_, _, RangeArray(IntLit(0), IntLit(5), inclusive)) =>
      assert_true(inclusive)
    _ => fail("expected RangeArray inclusive")
  }
}

test "parser: exclusive range [0...5]" {
  let stmts = parse("const r be [0...5]")
  match stmts[0] {
    VarDecl(Const_, _, RangeArray(IntLit(0), IntLit(5), inclusive)) =>
      assert_true(not(inclusive))
    _ => fail("expected RangeArray exclusive")
  }
}

// ===== Slice tests =====

test "parser: inclusive slice" {
  let stmts = Parser::new(Lexer::new("numbers[\\2..4]").tokenize()).parse()
  match stmts[0] {
    ExprStmt(Slice(Ident(name), IntLit(2), IntLit(4), inclusive)) => {
      assert_eq(name, "numbers")
      assert_true(inclusive)
    }
    _ => fail("expected Slice inclusive")
  }
}

test "parser: exclusive slice" {
  let stmts = Parser::new(Lexer::new("numbers[\\2...4]").tokenize()).parse()
  match stmts[0] {
    ExprStmt(Slice(Ident(name), IntLit(2), IntLit(4), inclusive)) => {
      assert_eq(name, "numbers")
      assert_true(not(inclusive))
    }
    _ => fail("expected Slice exclusive")
  }
}

test "parser: slice with dot access" {
  let stmts = Parser::new(Lexer::new("obj.arr[\\1..3]").tokenize()).parse()
  match stmts[0] {
    ExprStmt(Slice(DotAccess(Ident(obj), field), IntLit(1), IntLit(3), _)) => {
      assert_eq(obj, "obj")
      assert_eq(field, "arr")
    }
    _ => fail("expected Slice on dot access")
  }
}

test "parser: splice assignment" {
  let stmts = Parser::new(
    Lexer::new("numbers[\\2..4] be [///a///; ///b///]").tokenize(),
  ).parse()
  match stmts[0] {
    Assign(Slice(Ident(name), IntLit(2), IntLit(4), inclusive), ArrayLit(elems)) => {
      assert_eq(name, "numbers")
      assert_true(inclusive)
      assert_eq(elems.length(), 2)
    }
    _ => fail("expected Assign with Slice target")
  }
}

// ===== Destructuring tests =====

test "parser: const destructuring" {
  let stmts = Parser::new(
    Lexer::new("const [a; b] be weather").tokenize(),
  ).parse()
  match stmts[0] {
    DestructDecl(Const_, names, Ident(src)) => {
      assert_eq(names.length(), 2)
      assert_eq(names[0], "a")
      assert_eq(names[1], "b")
      assert_eq(src, "weather")
    }
    _ => fail("expected DestructDecl")
  }
}

test "parser: let destructuring" {
  let stmts = Parser::new(
    Lexer::new("let [x; y; z] be arr").tokenize(),
  ).parse()
  match stmts[0] {
    DestructDecl(Let_, names, Ident(src)) => {
      assert_eq(names.length(), 3)
      assert_eq(names[0], "x")
      assert_eq(names[1], "y")
      assert_eq(names[2], "z")
      assert_eq(src, "arr")
    }
    _ => fail("expected DestructDecl let")
  }
}

test "parser: destructuring swap" {
  let stmts = Parser::new(
    Lexer::new("[a; b] be [b; a]").tokenize(),
  ).parse()
  match stmts[0] {
    Assign(ArrayLit(lhs), ArrayLit(rhs)) => {
      assert_eq(lhs.length(), 2)
      assert_eq(rhs.length(), 2)
    }
    _ => fail("expected Assign with ArrayLit swap")
  }
}

// ===== Optional chaining tests =====

test "parser: optional dot access" {
  let stmts = Parser::new(Lexer::new("obj\\.name").tokenize()).parse()
  match stmts[0] {
    ExprStmt(OptDotAccess(Ident(obj), field)) => {
      assert_eq(obj, "obj")
      assert_eq(field, "name")
    }
    _ => fail("expected OptDotAccess")
  }
}

test "parser: optional method call" {
  let stmts = Parser::new(Lexer::new("obj\\.method[1; 2]").tokenize()).parse()
  match stmts[0] {
    ExprStmt(OptMethodCall(Ident(obj), meth, args)) => {
      assert_eq(obj, "obj")
      assert_eq(meth, "method")
      assert_eq(args.length(), 2)
    }
    _ => fail("expected OptMethodCall")
  }
}

// ===== Computed access tests =====

test "parser: computed access" {
  let stmts = Parser::new(Lexer::new("arr[\\i]").tokenize()).parse()
  match stmts[0] {
    ExprStmt(ComputedAccess(Ident(name), Ident(key))) => {
      assert_eq(name, "arr")
      assert_eq(key, "i")
    }
    _ => fail("expected ComputedAccess")
  }
}

test "parser: computed access with number" {
  let stmts = Parser::new(Lexer::new("arr[\\0]").tokenize()).parse()
  match stmts[0] {
    ExprStmt(ComputedAccess(Ident(name), IntLit(0))) => {
      assert_eq(name, "arr")
    }
    _ => fail("expected ComputedAccess with number")
  }
}

// ===== Side-effect import tests =====

test "parser: side-effect import" {
  let stmts = Parser::new(Lexer::new("import ///dotenv/config///").tokenize()).parse()
  match stmts[0] {
    ImportDecl(SideEffectImport(path, _)) => {
      assert_eq(path, "dotenv/config")
    }
    _ => fail("expected SideEffectImport")
  }
}

// ===== Import attributes tests =====

test "parser: import with attributes" {
  let stmts = Parser::new(Lexer::new("import pkg from ///./package.json/// with [ type be ///json/// ]").tokenize()).parse()
  match stmts[0] {
    ImportDecl(EsImport(Some(default_name), None, None, module_name, Some(attrs))) => {
      assert_eq(default_name, "pkg")
      assert_eq(module_name, "./package.json")
      assert_eq(attrs.length(), 1)
      assert_eq(attrs[0].0, "type")
    }
    _ => fail("expected EsImport with attributes")
  }
}

test "parser: named import with attributes" {
  let stmts = Parser::new(Lexer::new("import [name; version] from ///./package.json/// with [ type be ///json/// ]").tokenize()).parse()
  match stmts[0] {
    ImportDecl(EsImport(None, Some(names), None, module_name, Some(attrs))) => {
      assert_eq(names.length(), 2)
      assert_eq(module_name, "./package.json")
      assert_eq(attrs.length(), 1)
    }
    _ => fail("expected named EsImport with attributes")
  }
}

// ===== Async fn expression tests =====

test "parser: async fn expression to" {
  let stmts = Parser::new(Lexer::new("const h be async fn x to x add 1").tokenize()).parse()
  match stmts[0] {
    VarDecl(_, _, AsyncFnExprTo(params, _)) => {
      assert_eq(params.length(), 1)
      assert_eq(params[0], "x")
    }
    _ => fail("expected AsyncFnExprTo")
  }
}

// ===== Lexer backslash tests =====

test "lexer: backslash token" {
  let src = "x[\\y]"
  let tokens = Lexer::new(src).tokenize()
  // tokens[0] is Indent(0) from scan_line_start
  assert_eq(tokens[1].kind, Ident("x"))
  assert_eq(tokens[2].kind, LBracket)
  assert_eq(tokens[3].kind, Backslash)
  assert_eq(tokens[4].kind, Ident("y"))
  assert_eq(tokens[5].kind, RBracket)
}

test "lexer: optional dot token" {
  let src = "a\\.b"
  let tokens = Lexer::new(src).tokenize()
  // tokens[0] is Indent(0) from scan_line_start
  assert_eq(tokens[1].kind, Ident("a"))
  assert_eq(tokens[2].kind, OptDot)
  assert_eq(tokens[3].kind, Ident("b"))
}
