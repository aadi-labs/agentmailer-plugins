#!/usr/bin/env python3
"""Validate the portable AgentMailer plugin package without third-party deps."""

from __future__ import annotations

import json
import re
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
PLUGIN = ROOT / "plugins" / "agentmailer"
SKILLS = ("agentmailer-mcp", "agentmailer-inbox", "agentmailer-email")
EXPECTED_URL = "https://api.agentmailer.ai/mcp"


def load_json(path: Path) -> object:
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as error:
        raise AssertionError(f"invalid JSON at {path.relative_to(ROOT)}: {error}") from error


def validate() -> None:
    required = (
        ROOT / ".agents/plugins/marketplace.json",
        ROOT / ".claude-plugin/marketplace.json",
        PLUGIN / ".claude-plugin/plugin.json",
        PLUGIN / ".codex-plugin/plugin.json",
        PLUGIN / ".mcp.json",
        PLUGIN / "assets/agentmailer-icon-512.png",
        ROOT / "README.md",
        ROOT / "LICENSE",
        ROOT / "SECURITY.md",
    )
    for path in required:
        assert path.is_file(), f"missing {path.relative_to(ROOT)}"

    claude_manifest = load_json(PLUGIN / ".claude-plugin/plugin.json")
    codex_manifest = load_json(PLUGIN / ".codex-plugin/plugin.json")
    assert isinstance(claude_manifest, dict)
    assert isinstance(codex_manifest, dict)
    assert claude_manifest["name"] == codex_manifest["name"] == "agentmailer"
    assert claude_manifest["version"] == codex_manifest["version"]

    claude_mcp = load_json(PLUGIN / ".mcp.json")
    assert claude_mcp["mcpServers"]["agentmailer"]["url"] == EXPECTED_URL
    assert codex_manifest["mcpServers"] == "./.mcp.json"

    for skill in SKILLS:
        skill_file = PLUGIN / "skills" / skill / "SKILL.md"
        assert skill_file.is_file(), f"missing {skill_file.relative_to(ROOT)}"
        text = skill_file.read_text(encoding="utf-8")
        assert re.search(rf"^name:\s*{re.escape(skill)}$", text, re.MULTILINE)
        assert re.search(r"^description:\s*\S.+$", text, re.MULTILINE)
        assert "TODO" not in text

    forbidden = re.compile(
        r"(?:gho" + r"_[A-Za-z0-9]{20,}|\bsk-[A-Za-z0-9_-]{16,}|Bearer\s+[A-Za-z0-9._-]{16,})"
    )
    for path in ROOT.rglob("*"):
        if not path.is_file() or ".git" in path.parts or path.suffix == ".png":
            continue
        text = path.read_text(encoding="utf-8", errors="ignore")
        assert not forbidden.search(text), f"possible secret in {path.relative_to(ROOT)}"


if __name__ == "__main__":
    try:
        validate()
    except AssertionError as error:
        print(f"validation failed: {error}", file=sys.stderr)
        raise SystemExit(1)
    print("AgentMailer plugin package is structurally valid.")
