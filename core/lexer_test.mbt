// Blackbox lexer tests
// Run `moon test` to execute and `moon test --update` to refresh snapshots.

///|
test "lexer: shebang at start of file" {
  let src = "#!/usr/bin/env node\nconst x be 1"
  let tokens = @core.Lexer::new(src).tokenize()
  match tokens[0].kind {
    @core.Shebang(s) => assert_eq(s, "#!/usr/bin/env node")
    _ => fail("expected Shebang token")
  }
}

///|
test "lexer: no shebang without #!" {
  let src = "const x be 1"
  let tokens = @core.Lexer::new(src).tokenize()
  match tokens[0].kind {
    @core.Shebang(_) => fail("should not have shebang")
    _ => () // ok
  }
}

///|
test "lexer: class keyword" {
  let lexer = @core.Lexer::new("class")
  let tokens = lexer.tokenize()
  assert_eq(tokens[1].kind, @core.Class_)
}

///|
test "lexer: extends keyword" {
  let lexer = @core.Lexer::new("extends")
  let tokens = lexer.tokenize()
  assert_eq(tokens[1].kind, @core.Extends_)
}

///|
test "lexer: super keyword" {
  let lexer = @core.Lexer::new("super")
  let tokens = lexer.tokenize()
  assert_eq(tokens[1].kind, @core.Super_)
}

///|
test "lexer: static keyword" {
  let lexer = @core.Lexer::new("static")
  let tokens = lexer.tokenize()
  assert_eq(tokens[1].kind, @core.Static_)
}

///|
test "lexer: private keyword" {
  let lexer = @core.Lexer::new("private")
  let tokens = lexer.tokenize()
  assert_eq(tokens[1].kind, @core.Private_)
}

///|
test "lexer: get keyword" {
  let lexer = @core.Lexer::new("get")
  let tokens = lexer.tokenize()
  assert_eq(tokens[1].kind, @core.Get_)
}

///|
test "lexer: set keyword" {
  let lexer = @core.Lexer::new("set")
  let tokens = lexer.tokenize()
  assert_eq(tokens[1].kind, @core.Set_)
}

///|
test "lexer: switch keyword" {
  let lexer = @core.Lexer::new("switch")
  let tokens = lexer.tokenize()
  assert_eq(tokens[1].kind, @core.Switch_)
}

///|
test "lexer: case keyword" {
  let lexer = @core.Lexer::new("case")
  let tokens = lexer.tokenize()
  assert_eq(tokens[1].kind, @core.Case_)
}

///|
test "lexer: public keyword" {
  let lexer = @core.Lexer::new("public")
  let tokens = lexer.tokenize()
  assert_eq(tokens[1].kind, @core.Public_)
}
