import { rm } from "node:fs/promises";
import { resolve } from "node:path";

// Fern's TypeScript generator builds in Linux and can leave a Linux-native
// node_modules tree in the mounted output directory. Keeping it makes the next
// macOS test fail before Vitest starts. The workspace lockfile owns installed
// dependencies, so discard only that generated dependency tree and let pnpm
// restore the correct platform packages after generation.
const generatedDependencyTree = resolve("sdk/typescript/node_modules");
await rm(generatedDependencyTree, { recursive: true, force: true });
console.log("Removed Fern's generated TypeScript dependency tree.");
