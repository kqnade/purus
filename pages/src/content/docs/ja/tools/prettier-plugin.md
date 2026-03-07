---
title: Prettier繝励Λ繧ｰ繧､繝ｳ
description: "@puruslang/prettier-plugin-purus 窶・Prettier縺ｧPurus繧ｳ繝ｼ繝峨ｒ繝輔か繝ｼ繝槭ャ繝医・
sidebar:
  order: 3
---

## 繧､繝ｳ繧ｹ繝医・繝ｫ

```sh
npm install -D prettier @puruslang/prettier-plugin-purus
```

## 菴ｿ縺・婿

### CLI

```sh
npx prettier --plugin @puruslang/prettier-plugin-purus --write "**/*.{purus,cpurus,mpurus}"
```

### 險ｭ螳壹ヵ繧｡繧､繝ｫ

`.prettierrc` 縺ｫ霑ｽ蜉:

```json
{
  "plugins": ["@puruslang/prettier-plugin-purus"],
  "tabWidth": 2
}
```

## 繝輔か繝ｼ繝槭ャ繝亥・螳ｹ

- **繧､繝ｳ繝・Φ繝・*: 荳雋ｫ縺励◆繧､繝ｳ繝・Φ繝医↓豁｣隕丞喧・医せ繝壹・繧ｹ縺ｾ縺溘・繧ｿ繝厄ｼ・
- **繧ｹ繝壹・繧ｹ**: 繝医・繧ｯ繝ｳ髢薙・遨ｺ逋ｽ繧呈ｭ｣隕丞喧
- **諡ｬ蠑ｧ**: 髢｢謨ｰ蜻ｼ縺ｳ蜃ｺ縺励・ `[]` 蜀・↓繧ｹ繝壹・繧ｹ繧貞・繧後↑縺・
- **蛹ｺ蛻・ｊ譁・ｭ・*: `,` 縺ｨ `;` 縺ｮ蠕後↓繧ｹ繝壹・繧ｹ繧堤｢ｺ菫・
- **譛ｫ蟆ｾ縺ｮ遨ｺ逋ｽ**: 譛ｫ蟆ｾ縺ｮ繧ｹ繝壹・繧ｹ繧貞炎髯､
- **譛ｫ蟆ｾ縺ｮ謾ｹ陦・*: 繝輔ぃ繧､繝ｫ縺梧隼陦後〒邨ゅｏ繧九％縺ｨ繧剃ｿ晁ｨｼ

## 萓・

繝輔か繝ｼ繝槭ャ繝亥燕:

```purus
const x   be   42
fn greet   name
    console.log[  name  ]
```

繝輔か繝ｼ繝槭ャ繝亥ｾ・

```purus
const x be 42
fn greet name
  console.log[name]
```
