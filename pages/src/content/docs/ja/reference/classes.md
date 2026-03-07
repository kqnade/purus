---
title: 繧ｯ繝ｩ繧ｹ
description: Purus縺ｮ繧ｯ繝ｩ繧ｹ螳｣險縲・
sidebar:
  order: 7
---

## 蝓ｺ譛ｬ逧・↑繧ｯ繝ｩ繧ｹ

```purus
class Animal
  fn speak
    console.log[///hello///]
```

繧ｳ繝ｳ繝代う繝ｫ邨先棡:

```js
class Animal {
  speak() {
    console.log("hello");
  }
}
```

## 繧ｳ繝ｳ繧ｹ繝医Λ繧ｯ繧ｿ

`fn new` 縺ｧ繧ｳ繝ｳ繧ｹ繝医Λ繧ｯ繧ｿ繧貞ｮ｣險縺励∪縺・

```purus
class Animal
  fn new name
    this.name be name
```

繧ｳ繝ｳ繝代う繝ｫ邨先棡:

```js
class Animal {
  constructor(name) {
    this.name = name;
  }
}
```

## 繝励Λ繧､繝吶・繝医ヵ繧｣繝ｼ繝ｫ繝・

`private` 縺ｧ繝励Λ繧､繝吶・繝医ヵ繧｣繝ｼ繝ｫ繝峨ｒ螳｣險縺励∪縺吶・avaScript縺ｧ縺ｯ `#` 縺ｧ繝励Λ繧､繝吶・繝医ヵ繧｣繝ｼ繝ｫ繝峨ｒ螳｣險縺励∪縺吶′縲￣urus縺ｧ縺ｯ `#` 縺御ｽｿ縺医↑縺・◆繧・`private` 繧ｭ繝ｼ繝ｯ繝ｼ繝峨ｒ菴ｿ縺・∪縺吶・

```purus
class Counter
  private count be 0

  fn increment
    this.count be this.count add 1

  get fn value to this.count
```

繧ｳ繝ｳ繝代う繝ｫ邨先棡:

```js
class Counter {
  #count = 0;
  increment() {
    this.#count = this.#count + 1;
  }
  get value() { return this.#count; }
}
```

`private` 縺ｧ螳｣險縺輔ｌ縺溘ヵ繧｣繝ｼ繝ｫ繝峨∈縺ｮ `this` 邨檎罰縺ｮ繧｢繧ｯ繧ｻ繧ｹ縺ｯ縲∬・蜍慕噪縺ｫ `#` 繝励Ξ繝輔ぅ繝・け繧ｹ莉倥″縺ｫ繧ｳ繝ｳ繝代う繝ｫ縺輔ｌ縺ｾ縺吶・

## 邯呎価

`extends` 縺ｧ繧ｵ繝悶け繝ｩ繧ｹ繧剃ｽ懈・縺励∪縺吶ゅさ繝ｳ繧ｹ繝医Λ繧ｯ繧ｿ蜀・〒 `super[args]` 繧貞他縺ｳ蜃ｺ縺励∪縺・

```purus
class Dog extends Animal
  fn new name
    super[name]

  fn bark
    console.log[///woof///]
```

繧ｳ繝ｳ繝代う繝ｫ邨先棡:

```js
class Dog extends Animal {
  constructor(name) {
    super(name);
  }
  bark() {
    console.log("woof");
  }
}
```

## 髱咏噪繝｡繧ｽ繝・ラ

`static fn` 縺ｧ髱咏噪繝｡繧ｽ繝・ラ繧貞ｮ｣險縺励∪縺・

```purus
class MathUtil
  static fn sum a; b to a add b
```

繧ｳ繝ｳ繝代う繝ｫ邨先棡:

```js
class MathUtil {
  static sum(a, b) { return a + b; }
}
```

## 繧ｲ繝・ち繝ｼ縺ｨ繧ｻ繝・ち繝ｼ

`get fn` 縺ｨ `set fn` 繧剃ｽｿ縺・∪縺・

```purus
class Temperature
  private celsius

  fn new celsius
    this.celsius be celsius

  get fn fahrenheit to this.celsius mul 1.8 add 32

  set fn fahrenheit value
    this.celsius be value sub 32 div 1.8
```

繧ｳ繝ｳ繝代う繝ｫ邨先棡:

```js
class Temperature {
  #celsius;
  constructor(celsius) {
    this.#celsius = celsius;
  }
  get fahrenheit() { return this.#celsius * 1.8 + 32; }
  set fahrenheit(value) {
    this.#celsius = (value - 32) / 1.8;
  }
}
```

## 髱槫酔譛溘Γ繧ｽ繝・ラ

```purus
class Api
  async fn fetch-data url
    const res be await fetch[url]
    return res.json[]
```

繧ｳ繝ｳ繝代う繝ｫ邨先棡:

```js
class Api {
  async fetch_data(url) {
    const res = await fetch(url);
    return res.json();
  }
}
```

## 蠑乗悽菴薙Γ繧ｽ繝・ラ

繝｡繧ｽ繝・ラ縺ｧ繧・`to` 繧剃ｽｿ縺｣縺ｦ蠑乗悽菴薙ｒ險倩ｿｰ縺ｧ縺阪∪縺・

```purus
class Greeter
  fn greet name to console.log[///Hello, [name]///]
```

繧ｳ繝ｳ繝代う繝ｫ邨先棡:

```js
class Greeter {
  greet(name) { return console.log(`Hello, ${name}`); }
}
```
