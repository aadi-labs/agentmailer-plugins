import { execFileSync } from "node:child_process";

try {
  const version = execFileSync(
    "docker",
    ["--host", process.argv[2], "info", "--format", "{{.ServerVersion}}"],
    {
      encoding: "utf8",
      timeout: 15000,
      stdio: ["ignore", "pipe", "pipe"],
    },
  ).trim();
  // Desktop can return exit 0 with an empty body or an EOF error as text.
  if (!/^\d+\.\d+\.\d+(?:[-+][\w.-]+)?$/.test(version))
    throw new Error("Invalid engine response");
} catch {
  console.error(
    "Docker engine is not ready. Start or restart Docker Desktop and verify docker info before generating clients. No generators were started.",
  );
  process.exitCode = 1;
}
