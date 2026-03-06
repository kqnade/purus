---
title: リンター
description: "@puruslang/linter — Purusの静的解析ツール。"
sidebar:
  order: 2
---

## インストール

```sh
npm install -D @puruslang/linter
```

グローバルインストール:

```sh
npm install -g @puruslang/linter
```

## 使い方

```sh
# 特定のファイルをリント
purus-lint src/main.purus

# ディレクトリ内の全ファイルをリント
purus-lint src

# config.purusの設定を使用してリント
purus-lint
```

ファイルが指定されていない場合、`purus-lint` は `config.purus` を読み込み、`entry` ディレクトリ内の全ファイルをリントします。

ファイルやディレクトリは位置引数として渡せます。

### オプション

| オプション | エイリアス | 説明 |
|---|---|---|
| `--config <file>` | | 設定ファイルのパス |
| `--help` | `-h` | ヘルプを表示 |

## ルール

| ルール | デフォルト | 説明 |
|---|---|---|
| `no-var` | `warn` | `var`を避け、`const`や`let`を使用する |
| `no-nil` | `off` | `nil`の代わりに`null`を使用する |
| `indent-size` | `warn` (2) | インデントはNスペースの倍数であること |
| `no-trailing-whitespace` | `warn` | 末尾の空白を禁止 |
| `max-line-length` | `off` (100) | 行の最大長 |
| `no-unused-import` | `warn` | 未使用インポートを警告 |
| `consistent-naming` | `off` (kebab-case) | 命名規則 |

## 設定

### config.purus

リンターの設定は `config.purus` でビルド設定と一緒に設定できます:

```
-- Linter settings
const lint.no-var be ///warn///
const lint.no-nil be ///off///
const lint.indent-size be 2
const lint.max-line-length be ///off///
const lint.no-trailing-whitespace be ///warn///
const lint.no-unused-import be ///warn///
const lint.consistent-naming be ///off///
```

## プログラマティックAPI

```js
const { lint } = require("@puruslang/linter");

const diagnostics = lint("var x be 42");
// [{ rule: "no-var", severity: "warn", line: 1, col: 1, message: "..." }]
```
