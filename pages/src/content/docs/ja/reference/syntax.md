---
title: 讒区枚縺ｮ讎りｦ・
description: Purus縺ｮ讒区枚縺ｮ讎りｦ√・
sidebar:
  order: 1
---

## 繝輔ぃ繧､繝ｫ諡｡蠑ｵ蟄・

| 諡｡蠑ｵ蟄・| 蜃ｺ蜉・| 隱ｬ譏・|
|---|---|---|
| `.purus` | `.js` | 讓呎ｺ褒avaScript |
| `.cpurus` | `.cjs` | CommonJS繝｢繧ｸ繝･繝ｼ繝ｫ |
| `.mpurus` | `.mjs` | ES繝｢繧ｸ繝･繝ｼ繝ｫ |

## 繧ｳ繝｡繝ｳ繝・

```purus
-- 縺薙ｌ縺ｯ陦後さ繝｡繝ｳ繝医〒縺・

--- 縺薙ｌ縺ｯ繝悶Ο繝・け
繧ｳ繝｡繝ｳ繝医〒縺・---
```

## 譁・ｭ怜・

譁・ｭ怜・縺ｯ繝医Μ繝励Ν繧ｹ繝ｩ繝・す繝･ `///` 縺ｧ蝗ｲ縺ｿ縺ｾ縺・

```purus
const greeting be ///Hello, World///
```

### 繧ｨ繧ｹ繧ｱ繝ｼ繝励す繝ｼ繧ｱ繝ｳ繧ｹ

| 繧ｨ繧ｹ繧ｱ繝ｼ繝・| 邨先棡 |
|---|---|
| `\n` | 謾ｹ陦・|
| `\t` | 繧ｿ繝・|
| `\\` | 繝舌ャ繧ｯ繧ｹ繝ｩ繝・す繝･ |
| `\/` | `/` |
| `\[` | `[`・医Μ繝・Λ繝ｫ繝悶Λ繧ｱ繝・ヨ・・|
| `\]` | `]`・医Μ繝・Λ繝ｫ繝悶Λ繧ｱ繝・ヨ・・|

### 譁・ｭ怜・陬憺俣・医ユ繝ｳ繝励Ξ繝ｼ繝医Μ繝・Λ繝ｫ・・

譁・ｭ怜・蜀・〒 `[蠑従` 繧剃ｽｿ縺・→縲∝ｼ上ｒ蝓九ａ霎ｼ繧縺薙→縺後〒縺阪∪縺・

```purus
const name be ///Alice///
const age be 30
const msg be ///Hello, [name]! You are [age] years old.///
```

繧ｳ繝ｳ繝代う繝ｫ邨先棡:

```js
const name = "Alice";
const age = 30;
const msg = `Hello, ${name}! You are ${age} years old.`;
```

繝悶Λ繧ｱ繝・ヨ蜀・〒縺ｯ莉ｻ諢上・蠑上ｒ菴ｿ縺医∪縺・

```purus
const x be 10
const result be ///[x] times 2 is [x mul 2]///
```

繧ｳ繝ｳ繝代う繝ｫ邨先棡:

```js
const x = 10;
const result = `${x} times 2 is ${x * 2}`;
```

譁・ｭ怜・蜀・↓繝ｪ繝・Λ繝ｫ縺ｮ `[` 繧・`]` 繧貞性繧√◆縺・ｴ蜷医・縲√お繧ｹ繧ｱ繝ｼ繝励す繝ｼ繧ｱ繝ｳ繧ｹ `\[` 縺ｨ `\]` 繧剃ｽｿ縺・∪縺吶・

## 謨ｰ蛟､

```purus
const i be 42
const f be 3.14
```

## 逵溷⊃蛟､縺ｨnull

```purus
const a be true
const b be false
const c be null
const d be nil       -- null縺ｮ繧ｨ繧､繝ｪ繧｢繧ｹ
const e be undefined
```

## 驟榊・

```purus
const arr be [1, 2, 3]
const arr2 be [1; 2; 3]   -- 繧ｻ繝溘さ繝ｭ繝ｳ繧ゆｽｿ逕ｨ蜿ｯ閭ｽ
const empty be []
```

### 驟榊・縺ｮ遽・峇

```purus
const inclusive be [0..5]   -- [0, 1, 2, 3, 4, 5]
const exclusive be [0...5]  -- [0, 1, 2, 3, 4]
```

### 繧ｹ繝ｩ繧､繧ｹ・亥・繧雁・縺暦ｼ・

`\` 繝励Ξ繝輔ぅ繝・け繧ｹ縺ｨ `..`・亥桁蜷ｫ・峨∪縺溘・ `...`・域賜莉厄ｼ峨ｒ菴ｿ縺｣縺ｦ驟榊・縺ｮ荳驛ｨ繧貞・繧雁・縺励∪縺・

```purus
const numbers be [0, 1, 2, 3, 4, 5, 6]
const middle be numbers[\2..4]    -- [2, 3, 4]
const partial be numbers[\1...4]  -- [1, 2, 3]
```

繧ｳ繝ｳ繝代う繝ｫ邨先棡:

```js
const middle = numbers.slice(2, 4 + 1);
const partial = numbers.slice(1, 4);
```

### 繧ｹ繝励Λ繧､繧ｹ・磯Κ蛻・ｽｮ謠幢ｼ・

繧ｹ繝ｩ繧､繧ｹ縺ｫ莉｣蜈･縺吶ｋ縺薙→縺ｧ驟榊・縺ｮ荳驛ｨ繧堤ｽｮ謠帙〒縺阪∪縺・

```purus
numbers[\2..4] be [///a///; ///b///; ///c///]
-- numbers 縺ｯ [0, 1, "a", "b", "c", 5, 6] 縺ｫ縺ｪ繧翫∪縺・
```

繧ｳ繝ｳ繝代う繝ｫ邨先棡:

```js
numbers.splice(2, 4 - 2 + 1, "a", "b", "c");
```

### 蛻・牡莉｣蜈･

驟榊・縺九ｉ螟画焚縺ｫ蛟､繧貞叙繧雁・縺励∪縺・

```purus
const weather be [///Sunny///; ///Rainy///]
const [today; tomorrow] be weather

-- 螟画焚縺ｮ蛟､繧貞・繧梧崛縺医ｋ
[today; tomorrow] be [tomorrow; today]
```

繧ｳ繝ｳ繝代う繝ｫ邨先棡:

```js
const [today, tomorrow] = weather;
[today, tomorrow] = [tomorrow, today];
```

## 繧ｪ繝悶ず繧ｧ繧ｯ繝・

```purus
const obj be [name be ///Alice///, age be 30]
const empty-obj be [be]    -- 遨ｺ縺ｮ繧ｪ繝悶ず繧ｧ繧ｯ繝・
```

### 繧ｪ繝悶ず繧ｧ繧ｯ繝亥・蜑ｲ莉｣蜈･

`object[...]` 繧剃ｽｿ縺｣縺ｦ繧ｪ繝悶ず繧ｧ繧ｯ繝医°繧峨・繝ｭ繝代ユ繧｣繧貞叙繧雁・縺励∪縺・

```purus
const person be [name be ///Alice///, age be 30]
const object[name; age] be person
```

繧ｳ繝ｳ繝代う繝ｫ邨先棡:

```js
const person = { name: "Alice", age: 30 };
const { name, age } = person;
```

## 諡ｬ蠑ｧ縺ｯ`[]`縺ｮ縺ｿ

Purus縺ｧ縺ｯ髢｢謨ｰ蜻ｼ縺ｳ蜃ｺ縺励・・蛻励√が繝悶ず繧ｧ繧ｯ繝医√げ繝ｫ繝ｼ繝怜喧縺ｮ縺吶∋縺ｦ縺ｫ `[]` 繧剃ｽｿ逕ｨ縺励∪縺吶Ａ()` 繧・`{}` 縺ｯ菴ｿ縺・∪縺帙ｓ縲・

### 險育ｮ励・繝ｭ繝代ユ繧｣繧｢繧ｯ繧ｻ繧ｹ

`\` 繧呈峡蠑ｧ蜀・〒菴ｿ縺・％縺ｨ縺ｧ縲∝ｼ上↓繧医ｋ驟榊・繝ｻ繧ｪ繝悶ず繧ｧ繧ｯ繝医い繧ｯ繧ｻ繧ｹ繧定｡後＞縺ｾ縺・

```purus
const val be arr[\0]        -- arr[0]
const item be obj[\key]     -- obj[key]
const x be matrix[\i][\j]  -- matrix[i][j]
```

`\` 繝励Ξ繝輔ぅ繝・け繧ｹ縺ｫ繧医ｊ縲・未謨ｰ蜻ｼ縺ｳ蜃ｺ縺励→繝励Ο繝代ユ繧｣繧｢繧ｯ繧ｻ繧ｹ繧貞玄蛻･縺励∪縺・

| 讒区枚 | 諢丞袖 | JS蜃ｺ蜉・|
|---|---|---|
| `f[x]` | 髢｢謨ｰ蜻ｼ縺ｳ蜃ｺ縺・| `f(x)` |
| `arr[\x]` | 險育ｮ励・繝ｭ繝代ユ繧｣繧｢繧ｯ繧ｻ繧ｹ | `arr[x]` |
| `arr[\2..4]` | 繧ｹ繝ｩ繧､繧ｹ | `arr.slice(2,5)` |

### 繧ｪ繝励す繝ｧ繝翫Ν繝√ぉ繧､繝九Φ繧ｰ

`\.` 縺ｧ繧ｪ繝励す繝ｧ繝翫Ν繝√ぉ繧､繝九Φ繧ｰ・・S 縺ｮ `?.`・峨ｒ陦ｨ迴ｾ縺励∪縺・

```purus
const name be user\.name          -- user?.name
const val be obj\.method[1; 2]    -- obj?.method(1, 2)
```

### 隍・焚陦梧峡蠑ｧ

諡ｬ蠑ｧ `[...]` 縺ｯ隍・焚陦後↓縺ｾ縺溘′繧九％縺ｨ縺後〒縺阪∪縺吶る・岼髢薙・謾ｹ陦後ｄ繧､繝ｳ繝・Φ繝医・辟｡隕悶＆繧後∪縺・

```purus
const items be [
  1;
  2;
  3
]

const config be [
  host be ///localhost///,
  port be 8080
]

fetch[url].then[
  fn response
    return response.json[]
].catch[
  fn err
    console.error[err]
]
```

## 繧､繝ｳ繝・Φ繝・

繝悶Ο繝・け縺ｯ繧､繝ｳ繝・Φ繝医〒螳夂ｾｩ縺輔ｌ縺ｾ縺呻ｼ・繧ｹ繝壹・繧ｹ謗ｨ螂ｨ・・

```purus
if x gt 0
  console.log[///positive///]
else
  console.log[///non-positive///]
```

## 隴伜挨蟄・

隴伜挨蟄舌↓縺ｯ繝上う繝輔Φ・・-`・峨→繧｢繝ｳ繝繝ｼ繧ｹ繧ｳ繧｢・・_`・峨ｒ蜷ｫ繧√ｋ縺薙→縺後〒縺阪゛avaScript蜃ｺ蜉帙〒縺ｯ縺ｩ縺｡繧峨ｂ繧｢繝ｳ繝繝ｼ繧ｹ繧ｳ繧｢縺ｫ螟画鋤縺輔ｌ縺ｾ縺・

```purus
const my-variable be 42
-- 繧ｳ繝ｳ繝代う繝ｫ邨先棡: const my_variable = 42;

const my_variable2 be 43
-- 繧ｳ繝ｳ繝代う繝ｫ邨先棡: const my_variable2 = 43;
```

繝上う繝輔Φ縺ｨ繧｢繝ｳ繝繝ｼ繧ｹ繧ｳ繧｢縺ｯ莠呈鋤諤ｧ縺後≠繧翫∪縺・窶・`my-var` 縺ｨ `my_var` 縺ｯ蜷後§JavaScript螟画焚・・my_var`・峨ｒ蜿ら・縺励∪縺吶・S繝ｩ繧､繝悶Λ繝ｪ縺ｨ縺ｮ莠呈鋤諤ｧ縺ｮ縺溘ａ縲√←縺｡繧峨・蠖｢蠑上〒繧ゆｽｿ逕ｨ縺ｧ縺阪∪縺吶・

:::caution
`a-b` 縺ｨ `a_b` 縺ｯ縺ｩ縺｡繧峨ｂ `a_b` 縺ｫ繧ｳ繝ｳ繝代う繝ｫ縺輔ｌ繧九◆繧√∝酔縺倥せ繧ｳ繝ｼ繝励〒荳｡譁ｹ繧貞ｮ夂ｾｩ縺励↑縺・〒縺上□縺輔＞縲ょ酔縺伜､画焚繧貞盾辣ｧ縺励∪縺吶・
:::

## JavaScript 縺ｨ縺ｮ豈碑ｼ・

Purus縺ｯ螟壹￥縺ｮJavaScript險伜捷繧貞腰隱槭↓鄂ｮ縺肴鋤縺医∪縺吶ゅｈ縺丈ｽｿ縺・avaScript繝代ち繝ｼ繝ｳ縺ｨPurus縺ｮ蟇ｾ蠢懆｡ｨ縺ｧ縺・

### 繝・Φ繝励Ξ繝ｼ繝医Μ繝・Λ繝ｫ (`${}`)

JavaScript縺ｧ縺ｯ繝舌ャ繧ｯ繧ｯ繧ｩ繝ｼ繝医→ `${}` 繧剃ｽｿ縺・∪縺吶′縲￣urus縺ｧ縺ｯ `///` 譁・ｭ怜・縺ｨ `[]` 繧剃ｽｿ縺・∪縺・

```purus
-- JavaScript: `Hello, ${name}! You are ${age} years old.`
const msg be ///Hello, [name]! You are [age] years old.///

-- JavaScript: `${a} + ${b} = ${a + b}`
const result be ///[a] + [b] = [a add b]///
```

繧ｳ繝ｳ繝代う繝ｫ邨先棡:

```js
const msg = `Hello, ${name}! You are ${age} years old.`;
const result = `${a} + ${b} = ${a + b}`;
```

### Null蜷井ｽ・(`??`)

JavaScript縺ｮ `??` 貍皮ｮ怜ｭ舌・Purus縺ｧ縺ｯ `coal` 縺ｫ縺ｪ繧翫∪縺・

```purus
-- JavaScript: const port = config.port ?? 3000;
const port be config.port coal 3000

-- JavaScript: const name = user?.name ?? "Anonymous";
const name be user\.name coal ///Anonymous///
```

繧ｳ繝ｳ繝代う繝ｫ邨先棡:

```js
const port = config.port ?? 3000;
const name = user?.name ?? "Anonymous";
```

### 荳蛾・ｼ皮ｮ怜ｭ・(`? :`)

JavaScript縺ｮ荳蛾・ｼ皮ｮ怜ｭ・`condition ? a : b` 縺ｯ `if condition then a else b` 縺ｫ縺ｪ繧翫∪縺・

```purus
-- JavaScript: const label = count > 0 ? "items" : "empty";
const label be if count gt 0 then ///items/// else ///empty///
```

繧ｳ繝ｳ繝代う繝ｫ邨先棡:

```js
const label = count > 0 ? "items" : "empty";
```

### 繧ｪ繝励す繝ｧ繝翫Ν繝√ぉ繧､繝九Φ繧ｰ (`?.`)

JavaScript縺ｮ `?.` 縺ｯPurus縺ｧ縺ｯ `\.` 縺ｫ縺ｪ繧翫∪縺・

```purus
-- JavaScript: user?.address?.city
user\.address\.city

-- JavaScript: arr?.[0]
arr\.[\0]
```

繧ｳ繝ｳ繝代う繝ｫ邨先棡:

```js
user?.address?.city;
arr?.[0];
```

### 蜴ｳ蟇・ｭ我ｾ｡ (`===` / `!==`)

JavaScript縺ｮ `===` 縺ｯ `eq`・医∪縺溘・ `is`・峨～!==` 縺ｯ `neq`・医∪縺溘・ `not eq`・峨↓縺ｪ繧翫∪縺・

```purus
-- JavaScript: if (x === 0) {}
if x eq 0
  -- ...

-- JavaScript: if (x !== null) {}
if x neq null
  -- ...
```

繧ｳ繝ｳ繝代う繝ｫ邨先棡:

```js
if (x === 0) {}
if (x !== null) {}
```

### 繧｢繝ｭ繝ｼ髢｢謨ｰ (`=>`)

JavaScript縺ｮ `=>` 繧｢繝ｭ繝ｼ髢｢謨ｰ縺ｯ `fn` ... `to`・亥ｼ乗悽菴難ｼ峨∪縺溘・ `fn` 縺ｨ繧､繝ｳ繝・Φ繝医ヶ繝ｭ繝・け縺ｫ縺ｪ繧翫∪縺・

```purus
-- JavaScript: const double = (x) => x * 2;
const double be fn x to x mul 2

-- JavaScript: const greet = (name) => { console.log(name); };
const greet be fn name
  console.log[name]
```

繧ｳ繝ｳ繝代う繝ｫ邨先棡:

```js
const double = (x) => x * 2;
const greet = (name) => {
  console.log(name);
};
```
