---
title: 繝ｪ繝ｳ繧ｿ繝ｼ
description: "@puruslang/linter 窶・Purus縺ｮ髱咏噪隗｣譫舌ヤ繝ｼ繝ｫ縲・
sidebar:
  order: 2
---

## 繧､繝ｳ繧ｹ繝医・繝ｫ

```sh
npm install -D @puruslang/linter
```

繧ｰ繝ｭ繝ｼ繝舌Ν繧､繝ｳ繧ｹ繝医・繝ｫ:

```sh
npm install -g @puruslang/linter
```

## 菴ｿ縺・婿

```sh
# 迚ｹ螳壹・繝輔ぃ繧､繝ｫ繧偵Μ繝ｳ繝・
purus-lint src/main.purus

# 繝・ぅ繝ｬ繧ｯ繝医Μ蜀・・蜈ｨ繝輔ぃ繧､繝ｫ繧偵Μ繝ｳ繝・
purus-lint src

# config.purus縺ｮ險ｭ螳壹ｒ菴ｿ逕ｨ縺励※繝ｪ繝ｳ繝・
purus-lint
```

繝輔ぃ繧､繝ｫ縺梧欠螳壹＆繧後※縺・↑縺・ｴ蜷医～purus-lint` 縺ｯ `config.purus` 繧定ｪｭ縺ｿ霎ｼ縺ｿ縲～entry` 繝・ぅ繝ｬ繧ｯ繝医Μ蜀・・蜈ｨ繝輔ぃ繧､繝ｫ繧偵Μ繝ｳ繝医＠縺ｾ縺吶・

繝輔ぃ繧､繝ｫ繧・ョ繧｣繝ｬ繧ｯ繝医Μ縺ｯ菴咲ｽｮ蠑墓焚縺ｨ縺励※貂｡縺帙∪縺吶・

### 繧ｪ繝励す繝ｧ繝ｳ

| 繧ｪ繝励す繝ｧ繝ｳ | 繧ｨ繧､繝ｪ繧｢繧ｹ | 隱ｬ譏・|
|---|---|---|
| `--config <file>` | | 險ｭ螳壹ヵ繧｡繧､繝ｫ縺ｮ繝代せ |
| `--help` | `-h` | 繝倥Ν繝励ｒ陦ｨ遉ｺ |

## 繝ｫ繝ｼ繝ｫ

| 繝ｫ繝ｼ繝ｫ | 繝・ヵ繧ｩ繝ｫ繝・| 隱ｬ譏・|
|---|---|---|
| `no-var` | `warn` | `var`繧帝∩縺代～const`繧Яlet`繧剃ｽｿ逕ｨ縺吶ｋ |
| `no-nil` | `off` | `nil`縺ｮ莉｣繧上ｊ縺ｫ`null`繧剃ｽｿ逕ｨ縺吶ｋ |
| `indent-size` | `warn` (2) | 繧､繝ｳ繝・Φ繝医・N繧ｹ繝壹・繧ｹ縺ｮ蛟肴焚縺ｧ縺ゅｋ縺薙→ |
| `no-trailing-whitespace` | `warn` | 譛ｫ蟆ｾ縺ｮ遨ｺ逋ｽ繧堤ｦ∵ｭ｢ |
| `max-line-length` | `off` (100) | 陦後・譛螟ｧ髟ｷ |
| `no-unused-import` | `warn` | 譛ｪ菴ｿ逕ｨ繧､繝ｳ繝昴・繝医ｒ隴ｦ蜻・|
| `consistent-naming` | `off` (kebab-case) | 蜻ｽ蜷崎ｦ丞援 |

## 險ｭ螳・

### config.purus

繝ｪ繝ｳ繧ｿ繝ｼ縺ｮ險ｭ螳壹・ `config.purus` 縺ｧ繝薙Ν繝芽ｨｭ螳壹→荳邱偵↓險ｭ螳壹〒縺阪∪縺・

```purus
-- Linter settings
const lint.no-var be ///warn///
const lint.no-nil be ///off///
const lint.indent-size be 2
const lint.max-line-length be ///off///
const lint.no-trailing-whitespace be ///warn///
const lint.no-unused-import be ///warn///
const lint.consistent-naming be ///off///
```

## 繝励Ο繧ｰ繝ｩ繝槭ユ繧｣繝・けAPI

```js
const { lint } = require("@puruslang/linter");

const diagnostics = lint("var x be 42");
// [{ rule: "no-var", severity: "warn", line: 1, col: 1, message: "..." }]
```
