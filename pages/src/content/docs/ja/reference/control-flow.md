---
title: 蛻ｶ蠕｡繝輔Ο繝ｼ
description: Purus縺ｮ譚｡莉ｶ蛻・ｲ舌√Ν繝ｼ繝励√ヱ繧ｿ繝ｼ繝ｳ繝槭ャ繝√・
sidebar:
  order: 4
---

## If / Elif / Else

Purus縺ｯ繧､繝ｳ繝・Φ繝医〒繝悶Ο繝・け繧貞ｮ夂ｾｩ縺励∪縺・窶・豕｢諡ｬ蠑ｧ `{}` 縺ｯ荳崎ｦ√〒縺吶・

```purus
if x lt 0
  console.log[///negative///]
elif x eq 0
  console.log[///zero///]
else
  console.log[///positive///]
```

繧ｳ繝ｳ繝代う繝ｫ邨先棡:

```js
if (x < 0) {
  console.log("negative");
} else if (x === 0) {
  console.log("zero");
} else {
  console.log("positive");
}
```

:::tip
`elif` 縺ｯ `else if` 縺ｮ繧ｨ繧､繝ｪ繧｢繧ｹ縺ｧ縺吶ゅ←縺｡繧峨ｂ蜷後§繧医≧縺ｫ菴ｿ縺医∪縺・

```purus
if x lt 0
  console.log[///negative///]
else if x eq 0
  console.log[///zero///]
else
  console.log[///positive///]
```

縺薙ｌ縺ｯ `elif` 縺ｨ蜷後§JavaScript縺ｫ繧ｳ繝ｳ繝代う繝ｫ縺輔ｌ縺ｾ縺吶・
:::

### 隍・焚陦後ヶ繝ｭ繝・け

`if`縲～elif`縲～else` 縺ｮ荳九↓繧､繝ｳ繝・Φ繝医＆繧後◆譁・・縺吶∋縺ｦ縺昴・繝悶Ο繝・け縺ｫ螻槭＠縺ｾ縺・

```purus
if logged-in
  const user be get-user[]
  console.log[///Welcome, [user.name]///]
  show-dashboard[]
else
  console.log[///Please log in///]
  redirect[///login///]
```

繧ｳ繝ｳ繝代う繝ｫ邨先棡:

```js
if (loggedIn) {
  const user = getUser();
  console.log(`Welcome, ${user.name}`);
  showDashboard();
} else {
  console.log("Please log in");
  redirect("login");
}
```

## Unless

`if` 縺ｮ蜷ｦ螳・

```purus
unless done
  keep-going[]
```

```js
if (!(done)) {
  keepGoing();
}
```

## 繧､繝ｳ繝ｩ繧､繝ｳif・井ｸ蛾・ｼ皮ｮ怜ｭ撰ｼ・

```purus
const result be if condition then 1 else 2
```

```js
const result = condition ? 1 : 2;
```

## 蠕檎ｽｮ菫ｮ鬟ｾ蟄・

遏ｭ縺・擅莉ｶ蛻・ｲ舌ｄ繝ｫ繝ｼ繝励ｒ1陦後〒譖ｸ縺代∪縺・

```purus
console.log[///debug///] if verbose
console.log[///skip///] unless done
console.log[item] for item in list
```

繧ｳ繝ｳ繝代う繝ｫ邨先棡:

```js
if (verbose) {
  console.log("debug");
}
if (!(done)) {
  console.log("skip");
}
for (const item of list) {
  console.log(item);
}
```

## While / Until

```purus
while i lt 10
  i be i add 1

until finished
  do-work[]
```

繧ｳ繝ｳ繝代う繝ｫ邨先棡:

```js
while (i < 10) {
  i = i + 1;
}
while (!(finished)) {
  doWork();
}
```

## For-in

```purus
for item in items
  console.log[item]
```

```js
for (const item of items) {
  console.log(item);
}
```

繧､繝ｳ繝・ャ繧ｯ繧ｹ莉倥″:

```purus
for i; item in items
  console.log[i; item]
```

```js
for (let [i, item] of items.entries()) {
  console.log(i, item);
}
```

## For-range

```purus
for i in range 0; 10
  console.log[i]
```

```js
for (let i = 0; i < 10; i++) {
  console.log(i);
}
```

## Match / When

```purus
match x
  when 1 then ///one///
  when 2 then ///two///
  else ///other///
```

繧ｳ繝ｳ繝代う繝ｫ邨先棡:

```js
if (x === 1) {
  "one";
} else if (x === 2) {
  "two";
} else {
  "other";
}
```

繧ｬ繝ｼ繝我ｻ倥″:

```purus
match value
  when n if n gt 0
    console.log[///positive///]
  else
    console.log[///non-positive///]
```

繧ｳ繝ｳ繝代う繝ｫ邨先棡:

```js
if (value > 0) {
  console.log("positive");
} else {
  console.log("non-positive");
}
```

## try / catch / finally

```purus
try
  risky[]
catch e
  console.log[e]
finally
  cleanup[]
```

繧ｳ繝ｳ繝代う繝ｫ邨先棡:

```js
try {
  risky();
} catch (e) {
  console.log(e);
} finally {
  cleanup();
}
```

### 蠑上→縺励※縺ｮtry

```purus
const result be try
  risky[]
catch e
  default-value
```

繧ｳ繝ｳ繝代う繝ｫ邨先棡:

```js
let result;
try {
  result = risky();
} catch (e) {
  result = defaultValue;
}
```

## Throw

```purus
throw new Error[///something went wrong///]
throw err if condition
```

繧ｳ繝ｳ繝代う繝ｫ邨先棡:

```js
throw new Error("something went wrong");
if (condition) {
  throw err;
}
```
