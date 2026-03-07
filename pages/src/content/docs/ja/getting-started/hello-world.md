---
title: Hello World
description: 蛻昴ａ縺ｦ縺ｮPurus繝励Ο繧ｰ繝ｩ繝縲・
sidebar:
  order: 3
---

## Hello World

```purus
const message be ///Hello, World///
console.log[message]
```

繧ｳ繝ｳ繝代う繝ｫ邨先棡:

```js
const message = "Hello, World";
console.log(message);
```

## 螳溯｡梧婿豕・

繝輔ぃ繧､繝ｫ縺ｫ繧ｳ繝ｳ繝代う繝ｫ:

```sh
purus build hello.purus
node hello.js
```

縺ｾ縺溘・逶ｴ謗･螳溯｡・

```sh
purus run hello.purus
```

## JavaScript縺ｨ縺ｮ荳ｻ縺ｪ驕輔＞

| JavaScript | Purus |
|---|---|
| `=` | `be` |
| `"string"` | `///string///` |
| `fn(args)` | `fn[args]` |
| `{ }` 繝悶Ο繝・け | 繧､繝ｳ繝・Φ繝・|
| `function` | `fn` |
| `+` `-` `*` `/` | `add` `sub` `mul` `div` |
| `===` `!==` | `eq` `ne` |
| `&&` `\|\|` `!` | `and` `or` `not` |

## 螟画焚

```purus
const x be 42
let y be 3.14
y be 100
```

## 髢｢謨ｰ

```purus
fn greet name
  console.log[///Hello/// add name]

greet[///World///]
```

蠑乗悽菴難ｼ・to`繧剃ｽｿ逕ｨ・・

```purus
fn double x to x mul 2
```
