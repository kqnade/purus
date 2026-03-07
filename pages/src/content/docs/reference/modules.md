---
title: Modules
description: Import, export, and module system in Purus.
sidebar:
  order: 6
---

## ESM Import

```purus
import express from ///express///
import [useState, useEffect] from ///react///
import React, [Component] from ///react///
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
pub fn helper to 42
pub const VERSION be ///1.0///
export default fn main
  console.log[///hi///]
```

## Module namespace

```purus
namespace utils
  fn helper to 42
```

```js
const utils = (() => {
  function helper() { return 42; }
})();
```

## CommonJS

```purus
const fs be require[///fs///]
```

```js
const fs = require("fs");
```
