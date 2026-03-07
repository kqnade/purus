---
title: 貍皮ｮ怜ｭ・
description: Purus縺ｮ貍皮ｮ怜ｭ舌→蜆ｪ蜈磯・ｽ阪・
sidebar:
  order: 3
---

## 貍皮ｮ怜ｭ舌・蜆ｪ蜈磯・ｽ搾ｼ井ｽ弱＞鬆・ｼ・

1. `pipe` 窶・繝代う繝励Λ繧､繝ｳ
2. `coal` 窶・Null蜷井ｽ・
3. `or` 窶・隲也炊OR
4. `and` 窶・隲也炊AND
5. `eq` / `neq` / `not eq` / `is` / `instanceof` 窶・遲我ｾ｡ / 蝙九メ繧ｧ繝・け
6. `lt` / `gt` / `le`・・lt eq`・・/ `ge`・・gt eq`・・窶・豈碑ｼ・
7. `add` / `sub` 窶・蜉邂・/ 貂帷ｮ・
8. `mul` / `div` / `mod` 窶・荵礼ｮ・/ 髯､邂・/ 蜑ｰ菴・
9. `pow` 窶・縺ｹ縺堺ｹ・
10. 蜊倬・ `not` / `neg` / `typeof` / `await` / `delete` / `new`
11. 蠕檎ｽｮ: `.` 繧｢繧ｯ繧ｻ繧ｹ / `\.` 繧ｪ繝励す繝ｧ繝翫Ν繝√ぉ繧､繝九Φ繧ｰ / `[args]` 蜻ｼ縺ｳ蜃ｺ縺・/ `[\expr]` 險育ｮ励い繧ｯ繧ｻ繧ｹ / `as` 繧ｭ繝｣繧ｹ繝・
12. 蝓ｺ譛ｬ: 繝ｪ繝・Λ繝ｫ縲∬ｭ伜挨蟄舌∵峡蠑ｧ

## 繝代う繝励Λ繧､繝ｳ

```purus
data pipe filter
data pipe filter pipe map
data pipe transform[extra-arg]
data pipe .method[arg]
```

繧ｳ繝ｳ繝代う繝ｫ邨先棡:

```js
filter(data)
map(filter(data))
transform(data, extraArg)
data.method(arg)
```

## 莉｣蜈･

```purus
const x be 42
let y be 10
y be 20
```

## 邂苓｡・

```purus
a add b    -- a + b
a sub b    -- a - b
a mul b    -- a * b
a div b    -- a / b
a mod b    -- a % b
a pow b    -- a ** b
neg x      -- -x
```

## 豈碑ｼ・

`eq` 縺ｨ `is` 縺ｯ蜷後§繧医≧縺ｫ菴ｿ縺医∪縺吶ょ承霎ｺ縺悟梛蜷搾ｼ・string`, `number`, `null`, 螟ｧ譁・ｭ怜ｧ九∪繧翫・繧ｯ繝ｩ繧ｹ蜷阪↑縺ｩ・峨・蝣ｴ蜷医・蝙九メ繧ｧ繝・け縺ｫ縺ｪ繧翫√◎繧御ｻ･螟悶・蜴ｳ蟇・ｭ我ｾ｡豈碑ｼ・ｼ・===`・峨↓縺ｪ繧翫∪縺吶・

荳咲ｭ我ｾ｡縺ｫ縺ｯ `neq` 縺ｾ縺溘・ `not eq` 繧剃ｽｿ縺・∪縺吶ゆｻ･荳九・縺ｩ縺｡繧峨ｂ `le` 縺ｨ蜷後§諢丞袖縺ｧ縺・ `lt eq`縲ゆｻ･荳九・縺ｩ縺｡繧峨ｂ `ge` 縺ｨ蜷後§諢丞袖縺ｧ縺・ `gt eq`縲・

```purus
a eq b      -- a === b
a neq b     -- a !== b
a not eq b  -- a !== b・亥挨縺ｮ譖ｸ縺肴婿・・
a lt b      -- a < b
a gt b      -- a > b
a le b      -- a <= b
a lt eq b   -- a <= b・亥挨縺ｮ譖ｸ縺肴婿・・
a ge b      -- a >= b
a gt eq b   -- a >= b・亥挨縺ｮ譖ｸ縺肴婿・・

-- eq 縺ｨ is 縺ｯ豺ｷ蜷後＠縺ｦ菴ｿ縺医ｋ
a eq b     -- a === b・亥､縺ｮ豈碑ｼ・ｼ・
a is b     -- a === b・亥､縺ｮ豈碑ｼ・ｼ・
a eq string -- typeof a === "string"・亥梛繝√ぉ繝・け・・
a is string -- typeof a === "string"・亥梛繝√ぉ繝・け・・
```

## 驟榊・縺ｮ遽・峇

`..`・亥桁蜷ｫ・峨→ `...`・域賜莉厄ｼ峨ｒ菴ｿ縺｣縺ｦ謨ｰ蛟､遽・峇縺九ｉ驟榊・繧堤函謌舌＠縺ｾ縺・

```purus
const a be [0..5]     -- [0, 1, 2, 3, 4, 5]
const b be [0...5]    -- [0, 1, 2, 3, 4]
const c be [1..10]    -- [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
const d be [1...10]   -- [1, 2, 3, 4, 5, 6, 7, 8, 9]
```

## 繧ｹ繝ｩ繧､繧ｹ・亥・繧雁・縺暦ｼ・

`\` 繝励Ξ繝輔ぅ繝・け繧ｹ縺ｨ `..`・亥桁蜷ｫ・峨∪縺溘・ `...`・域賜莉厄ｼ峨ｒ繝悶Λ繧ｱ繝・ヨ繧｢繧ｯ繧ｻ繧ｹ蜀・〒菴ｿ縺・・・蛻励・荳驛ｨ繧貞・繧雁・縺励∪縺・

```purus
const numbers be [0, 1, 2, 3, 4, 5, 6]
const middle be numbers[\2..4]    -- [2, 3, 4]
const partial be numbers[\1...4]  -- [1, 2, 3]
```

## 繧ｹ繝励Λ繧､繧ｹ・磯Κ蛻・ｽｮ謠幢ｼ・

繧ｹ繝ｩ繧､繧ｹ縺ｫ莉｣蜈･縺吶ｋ縺薙→縺ｧ驟榊・縺ｮ荳驛ｨ繧堤ｽｮ謠帙〒縺阪∪縺・

```purus
numbers[\2..4] be [///a///; ///b///; ///c///]
-- numbers 縺ｯ [0, 1, "a", "b", "c", 5, 6] 縺ｫ縺ｪ繧翫∪縺・
```

## 險育ｮ励・繝ｭ繝代ユ繧｣繧｢繧ｯ繧ｻ繧ｹ

`\` 繧呈峡蠑ｧ蜀・〒菴ｿ縺・％縺ｨ縺ｧ縲∝ｼ上↓繧医ｋ驟榊・繝ｻ繧ｪ繝悶ず繧ｧ繧ｯ繝医い繧ｯ繧ｻ繧ｹ繧定｡後＞縺ｾ縺・

```purus
const val be arr[\i]       -- arr[i]
const item be obj[\key]    -- obj[key]
arr[\0] be ///new///        -- arr[0] = "new"
```

`\` 繝励Ξ繝輔ぅ繝・け繧ｹ縺ｫ繧医ｊ縲・未謨ｰ蜻ｼ縺ｳ蜃ｺ縺・`f[x]`)縺ｨ繝励Ο繝代ユ繧｣繧｢繧ｯ繧ｻ繧ｹ(`arr[\x]`)繧貞玄蛻･縺励∪縺吶・

## 繧ｪ繝励す繝ｧ繝翫Ν繝√ぉ繧､繝九Φ繧ｰ

`\.` 縺ｧ繧ｪ繝励す繝ｧ繝翫Ν繝√ぉ繧､繝九Φ繧ｰ・・S 縺ｮ `?.`・峨ｒ陦ｨ迴ｾ縺励∪縺・

```purus
const name be user\.name          -- user?.name
const val be obj\.method[1; 2]    -- obj?.method(1, 2)
const deep be a\.b\.c             -- a?.b?.c
```

繧ｳ繝ｳ繝代う繝ｫ邨先棡:

```js
const name = user?.name;
const val = obj?.method(1, 2);
const deep = a?.b?.c;
```

## 蛻・牡莉｣蜈･

驟榊・縺九ｉ螟画焚縺ｫ蛟､繧貞叙繧雁・縺励∪縺・

```purus
const weather be [///Sunny///; ///Rainy///]
const [today; tomorrow] be weather

-- 螟画焚縺ｮ蛟､繧貞・繧梧崛縺医ｋ
[today; tomorrow] be [tomorrow; today]
```

### 繧ｪ繝悶ず繧ｧ繧ｯ繝亥・蜑ｲ莉｣蜈･

`object[...]` 繧剃ｽｿ縺｣縺ｦ繧ｪ繝悶ず繧ｧ繧ｯ繝医°繧峨・繝ｭ繝代ユ繧｣繧貞叙繧雁・縺励∪縺・

```purus
const config be [host be ///localhost///, port be 8080]
const object[host; port] be config
```

繧ｳ繝ｳ繝代う繝ｫ邨先棡:

```js
const config = { host: "localhost", port: 8080 };
const { host, port } = config;
```

## 隲也炊

```purus
a and b    -- a && b
a or b     -- a || b
not x      -- !x
```

## Null蜷井ｽ難ｼ・ullish Coalescing・・

`coal` 貍皮ｮ怜ｭ舌・縲∝ｷｦ霎ｺ縺・`null` 縺ｾ縺溘・ `undefined` 縺ｮ蝣ｴ蜷医↓蜿ｳ霎ｺ縺ｮ蛟､繧定ｿ斐＠縺ｾ縺・

```purus
a coal b           -- a ?? b
a coal b coal c    -- a ?? b ?? c
```

繧ｳ繝ｳ繝代う繝ｫ邨先棡:

```js
a ?? b;
a ?? b ?? c;
```

`or` 縺ｨ縺ｮ驕輔＞: `or` 縺ｯ縺吶∋縺ｦ縺ｮfalsy蛟､・・false`, `0`, `""`, `null`, `undefined`・峨ｒfalse縺ｨ縺励※謇ｱ縺・∪縺吶′縲～coal` 縺ｯ `null` 縺ｨ `undefined` 縺ｮ縺ｿ繧偵檎ｩｺ縲阪→縺励※謇ｱ縺・∪縺吶Ａ0` 繧・`false` 繧・`""` 繧剃ｿ晄戟縺励◆縺・ｴ蜷医・ `coal` 繧剃ｽｿ縺｣縺ｦ縺上□縺輔＞縲・

```purus
const port be config.port coal 3000      -- port縺系ull/undefined縺ｮ蝣ｴ蜷医・縺ｿ3000繧剃ｽｿ逕ｨ
const name be user.name coal ///guest///  -- name縺系ull/undefined縺ｮ蝣ｴ蜷医・縺ｿ"guest"繧剃ｽｿ逕ｨ
```

## 蝙九メ繧ｧ繝・け

`eq` 縺ｨ `is` 縺ｯ縺ｩ縺｡繧峨ｂ蝙句錐縺ｮ蜑阪↓鄂ｮ縺上→蝙九メ繧ｧ繝・け縺ｨ縺励※讖溯・縺励∪縺吶・

```purus
x is string          -- typeof x === "string"
x eq string          -- typeof x === "string"
x is null            -- x === null
x is MyClass         -- x instanceof MyClass
x instanceof Y       -- x instanceof Y
typeof x             -- typeof x
```
