---
title: Modules
description: Import, export, and module system in Purus.
sidebar:
  order: 6
---

## ESM Import

```purus
import express from ///express///
import [Hono] from ///hono///
import [describe, it, expect] from ///vitest///
import axios, [AxiosError] from ///axios///
import all as fs from ///fs///
```

### Side-effect Import

Import a module for its side effects only (no bindings):

```purus
import ///dotenv/config///
import ///./polyfills///
```

```js
import "dotenv/config";
import "./polyfills";
```

### Import Attributes

Use the `with` keyword to specify import attributes:

```purus
import package from ///./package.json/// with [ type be ///json/// ]
import [name; version] from ///./package.json/// with [ type be ///json/// ]
```

```js
import package from "./package.json" with { type: "json" };
import { name, version } from "./package.json" with { type: "json" };
```

## Use (dot-path import)

```purus
use std.math
from std.math use sin, cos
```

```js
import * as math from "std/math";
import { sin, cos } from "std/math";
```

## Export

```purus
pub fn greet name to console.log[name]
pub const VERSION be ///1.0///
export default fn main
  console.log[///hi///]
```

## Module namespace

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
