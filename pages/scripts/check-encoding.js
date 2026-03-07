import { readdir, readFile } from "node:fs/promises";
import { join, relative } from "node:path";

const JA_DOCS_DIR = join(import.meta.dirname, "..", "src", "content", "docs", "ja");

// Unicode replacement character (indicates failed decode)
const REPLACEMENT_CHAR = /\uFFFD/;

// Non-printable control chars (except \t, \n, \r)
const CONTROL_CHARS = /[\x00-\x08\x0B\x0C\x0E-\x1F\x7F]/;

// Common Shift-JIS → UTF-8 mojibake sequences
const MOJIBAKE_PATTERNS = /[\u8E7B\u89B3\u7E4A\u7E4B\u7E4C]\u{FF64}|繝[ｪｫｬｭｮｯｰｱｲｳｴｵｶｷｸｹｺ]/u;

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

async function checkFile(filePath) {
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
    errors.push("Contains suspected Shift-JIS mojibake sequences");
  }

  if (!JAPANESE_CHARS.test(content)) {
    errors.push("No Japanese characters found (hiragana/katakana missing)");
  }

  return errors;
}

async function main() {
  const files = await collectFiles(JA_DOCS_DIR);
  let hasError = false;

  console.log(`Checking ${files.length} JA doc files for encoding issues...\n`);

  for (const file of files.sort()) {
    const rel = relative(JA_DOCS_DIR, file);
    const errors = await checkFile(file);
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
