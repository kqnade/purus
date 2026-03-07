import { readdir, readFile } from "node:fs/promises";
import { join, relative } from "node:path";

const DOCS_DIR = join(import.meta.dirname, "..", "src", "content", "docs");
const JA_DOCS_DIR = join(DOCS_DIR, "ja");

// Unicode replacement character (indicates failed decode)
const REPLACEMENT_CHAR = /\uFFFD/;

// Non-printable control chars (except \t, \n, \r)
const CONTROL_CHARS = /[\x00-\x08\x0B\x0C\x0E-\x1F\x7F]/;

// Common Shift-JIS → UTF-8 mojibake sequences
const MOJIBAKE_PATTERNS = /[\u8E7B\u89B3\u7E4A\u7E4B\u7E4C]\u{FF64}|繝[ｪｫｬｭｮｯｰｱｲｳｴｵｶｷｸｹｺ]|窶[・｢｣]/u;

// CJK Unified Ideographs + CJK Compatibility Ideographs
const CJK_CHARS = /[\u3000-\u9FFF\uF900-\uFAFF]/;

// Hiragana or Katakana range (JA files must contain Japanese)
const JAPANESE_CHARS = /[\u3040-\u309F\u30A0-\u30FF]/;

async function collectFiles(dir) {
  const entries = await readdir(dir, { withFileTypes: true });
  const files = [];
  for (const entry of entries) {
    const full = join(dir, entry.name);
    if (entry.isDirectory()) {
      files.push(...(await collectFiles(full)));
    } else if (/\.(md|mdx)$/i.test(entry.name)) {
      files.push(full);
    }
  }
  return files;
}

async function checkFile(filePath, isJa) {
  const content = await readFile(filePath, "utf-8");
  const errors = [];

  if (REPLACEMENT_CHAR.test(content)) {
    errors.push("Contains Unicode replacement character (U+FFFD)");
  }

  if (CONTROL_CHARS.test(content)) {
    const match = content.match(CONTROL_CHARS);
    errors.push(`Contains non-printable control character (0x${match[0].charCodeAt(0).toString(16).padStart(2, "0")})`);
  }

  if (MOJIBAKE_PATTERNS.test(content)) {
    errors.push("Contains suspected mojibake sequences");
  }

  if (isJa) {
    if (!JAPANESE_CHARS.test(content)) {
      errors.push("No Japanese characters found (hiragana/katakana missing)");
    }
  } else {
    if (CJK_CHARS.test(content)) {
      const match = content.match(CJK_CHARS);
      errors.push(`Contains unexpected CJK character: U+${match[0].codePointAt(0).toString(16).toUpperCase().padStart(4, "0")} "${match[0]}"`);
    }
  }

  return errors;
}

async function main() {
  const jaFiles = await collectFiles(JA_DOCS_DIR);
  const allFiles = await collectFiles(DOCS_DIR);
  const enFiles = allFiles.filter(f => !f.startsWith(JA_DOCS_DIR));
  let hasError = false;

  console.log(`Checking ${enFiles.length} EN + ${jaFiles.length} JA doc files...\n`);

  console.log("--- EN docs ---");
  for (const file of enFiles.sort()) {
    const rel = relative(DOCS_DIR, file);
    const errors = await checkFile(file, false);
    if (errors.length > 0) {
      hasError = true;
      console.error(`FAIL  ${rel}`);
      for (const e of errors) {
        console.error(`      - ${e}`);
      }
    } else {
      console.log(`OK    ${rel}`);
    }
  }

  console.log("\n--- JA docs ---");
  for (const file of jaFiles.sort()) {
    const rel = relative(JA_DOCS_DIR, file);
    const errors = await checkFile(file, true);
    if (errors.length > 0) {
      hasError = true;
      console.error(`FAIL  ${rel}`);
      for (const e of errors) {
        console.error(`      - ${e}`);
      }
    } else {
      console.log(`OK    ${rel}`);
    }
  }

  console.log();
  if (hasError) {
    console.error("Encoding check failed. Fix the issues above.");
    process.exit(1);
  } else {
    console.log("All files passed encoding check.");
  }
}

main();
