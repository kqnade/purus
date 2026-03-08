---
title: モジュール
description: Purusのインポート、エクスポート、モジュールシステム。
sidebar:
  order: 6
---

## ESMインポート

```purus
import express from ///express///
import [Hono] from ///hono///
import [describe, it, expect] from ///vitest///
import axios, [AxiosError] from ///axios///
import all as fs from ///fs///
```

### 副作用インポート

バインディングなしでモジュールの副作用のみをインポートします:

```purus
import ///dotenv/config///
import ///./polyfills///
```

```js
import "dotenv/config";
import "./polyfills";
```

### インポート属性

`with` キーワードを使用してインポート属性を指定できます:

```purus
import package from ///./package.json/// with [ type be ///json/// ]
import [name; version] from ///./package.json/// with [ type be ///json/// ]
```

```js
import package from "./package.json" with { type: "json" };
import { name, version } from "./package.json" with { type: "json" };
```

## Use（ドットパスインポート）

```purus
use std.math
from std.math use sin, cos
```

```js
import * as math from "std/math";
import { sin, cos } from "std/math";
```

## エクスポート

```purus
pub fn greet name to console.log[name]
pub const VERSION be ///1.0///
export default fn main
  console.log[///hi///]
```

## モジュール名前空間

```purus
namespace utils
  fn helper
    return 42
```

```js
const utils = (() => {
  function helper() {
    return 42;
  }
})();
```

## CommonJS

```purus
const fs be require[///fs///]
```

```js
const fs = require("fs");
```