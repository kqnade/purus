---
title: 髢｢謨ｰ
description: Purus縺ｮ髢｢謨ｰ螳｣險縺ｨ蠑上・
sidebar:
  order: 5
---

## 蜷榊燕莉倥″髢｢謨ｰ・医ヶ繝ｭ繝・け譛ｬ菴難ｼ・

```purus
fn greet name
  console.log[name]
```

繧ｳ繝ｳ繝代う繝ｫ邨先棡:

```js
function greet(name) {
  console.log(name);
}
```

## 蜷榊燕莉倥″髢｢謨ｰ・亥ｼ乗悽菴難ｼ・

```purus
fn double x to x mul 2
```

```js
function double(x) {
  return x * 2;
}
```

## 蠑墓焚縺ｪ縺鈴未謨ｰ

繝代Λ繝｡繝ｼ繧ｿ繧堤怐逡･縺吶ｋ縺縺代〒縺・

```purus
fn say-hello
  console.log[///Hello!///]
```

```js
function sayHello() {
  console.log("Hello!");
}
```

蠑乗悽菴薙・蝣ｴ蜷・

```purus
fn get-timestamp to Date.now[]
```

```js
function getTimestamp() { return Date.now(); }
```

## 隍・焚繝代Λ繝｡繝ｼ繧ｿ

繝代Λ繝｡繝ｼ繧ｿ縺ｮ蛹ｺ蛻・ｊ縺ｫ縺ｯ `;` 繧剃ｽｿ縺・∪縺・

```purus
fn add a; b
  return a add b
```

```js
function add(a, b) {
  return a + b;
}
```

## 辟｡蜷埼未謨ｰ

```purus
const double be fn x to x mul 2
```

```js
const double = (x) => x * 2;
```

### 蠑墓焚縺ｪ縺礼┌蜷埼未謨ｰ

```purus
const get-time be fn to Date.now[]
```

```js
const getTime = () => Date.now();
```

### 繝悶Ο繝・け譛ｬ菴謎ｻ倥″辟｡蜷埼未謨ｰ

```purus
const process be fn data
  console.log[data]
  return data
```

```js
const process = (data) => {
  console.log(data);
  return data;
};
```

## 髱槫酔譛滄未謨ｰ

```purus
async fn fetch-data url
  const res be await fetch[url]
  return res
```

```js
async function fetchData(url) {
  const res = await fetch(url);
  return res;
}
```

### 髱槫酔譛滄未謨ｰ蠑・

`async` 繝励Ξ繝輔ぅ繝・け繧ｹ縺ｧ辟｡蜷阪・髱槫酔譛滄未謨ｰ繧剃ｽ懈・縺ｧ縺阪∪縺・

```purus
const handler be async fn event to await process[event]

const fetcher be async fn url
  const res be await fetch[url]
  return await res.json[]
```

```js
const handler = async (event) => await process(event);

const fetcher = async (url) => {
  const res = await fetch(url);
  return await res.json();
};
```

## 繧､繝ｳ繝ｩ繧､繝ｳ繧ｳ繝ｼ繝ｫ繝舌ャ繧ｯ

隍・焚陦梧峡蠑ｧ縺ｮ繧ｵ繝昴・繝医↓繧医ｊ縲√Γ繧ｽ繝・ラ繝√ぉ繝ｼ繝ｳ蜀・〒辟｡蜷埼未謨ｰ繧貞ｼ墓焚縺ｨ縺励※貂｡縺帙∪縺・

```purus
promise.then[fn result to console.log[result]].catch[fn err to console.error[err]]
```

隍・焚陦悟ｽ｢蠑・

```purus
fetch[url].then[
  fn response
    return response.json[]
].then[
  fn data
    console.log[data]
].catch[
  fn err
    console.error[err]
]
```

```js
fetch(url).then((response) => {
  return response.json();
}).then((data) => {
  console.log(data);
}).catch((err) => {
  console.error(err);
});
```

## 髢｢謨ｰ蜻ｼ縺ｳ蜃ｺ縺・

`()` 縺ｮ莉｣繧上ｊ縺ｫ `[]` 繧剃ｽｿ縺・∪縺・

```purus
greet[///world///]
add[1; 2]
console.log[///hello///]
```

```js
greet("world");
add(1, 2);
console.log("hello");
```

### 繝阪せ繝医＆繧後◆髢｢謨ｰ蜻ｼ縺ｳ蜃ｺ縺・

JavaScript縺ｧ縺ｯ `a(b(c), d)` 縺ｮ繧医≧縺ｫ繝阪せ繝医＠縺溷他縺ｳ蜃ｺ縺励↓縺ｯ `()` 繧剃ｽｿ縺・∪縺吶１urus縺ｧ縺ｯ `[]` 繧帝・蛻励→蜻ｼ縺ｳ蜃ｺ縺励・荳｡譁ｹ縺ｫ菴ｿ縺・◆繧√∝ｼ墓焚縺ｮ蛹ｺ蛻・ｊ縺ｫ `;` 繧剃ｽｿ縺・∪縺・

```purus
-- JS: a(b(c), d)
a[b[c]; d]

-- JS: a(b, c(d, e))
a[b; c[d; e]]

-- JS: console.log(Math.max(1, 2))
console.log[Math.max[1; 2]]

-- JS: fn(a(1, 2), b(3, 4), c)
fn[a[1; 2]; b[3; 4]; c]

-- JS: outer(inner1(x), inner2(y, z))
outer[inner1[x]; inner2[y; z]]
```

```js
a(b(c), d);
a(b, c(d, e));
console.log(Math.max(1, 2));
fn(a(1, 2), b(3, 4), c);
outer(inner1(x), inner2(y, z));
```

## 蝙区ｳｨ驥茨ｼ域ｶ亥悉縺輔ｌ繧具ｼ・

```purus
fn add a of Number; b of Number gives Number to a add b
```

`of` 縺ｨ `gives` 縺ｫ繧医ｋ蝙区ｳｨ驥医・JavaScript蜃ｺ蜉帙〒縺ｯ豸亥悉縺輔ｌ縺ｾ縺吶・

## return

```purus
fn get-value
  return 42
```
