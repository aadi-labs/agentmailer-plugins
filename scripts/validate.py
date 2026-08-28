#!/usr/bin/env python3
"""Validate the portable AgentMailer plugin package without third-party deps."""

from __future__ import annotations

import json
import re
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SKILLS = ("agentmailer-mcp", "agentmailer-inbox", "agentmailer-email")
EXPECTED_URL = "https://api.agentmailer.ai/mcp"
PLUGIN_SCHEMA = "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json"
MCP_SCHEMA = "https://agent-plugins.org/schemas/1.0.0/mcp.schema.json"


def load_json(path: Path) -> object:
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as error:
        raise AssertionError(f"invalid JSON at {path.relative_to(ROOT)}: {error}") from error


def validate() -> None:
    required = (
        ROOT / ".agents/plugins/marketplace.json",
        ROOT / ".claude-plugin/marketplace.json",
        ROOT / ".claude-plugin/plugin.json",
        ROOT / ".codex-plugin/plugin.json",
        ROOT / ".mcp.json",
        ROOT / "plugin.json",
        ROOT / "mcp.json",
        ROOT / "package.json",
        ROOT / "compat/opencode/opencode.json",
        ROOT / "plugins/agentmailer/assets/agentmailer-icon-512.png",
        ROOT / "README.md",
        ROOT / "LICENSE",
        ROOT / "SECURITY.md",
    )
    for path in required:
        assert path.is_file(), f"missing {path.relative_to(ROOT)}"

    claude_manifest = load_json(ROOT / ".claude-plugin/plugin.json")
    codex_manifest = load_json(ROOT / ".codex-plugin/plugin.json")
    portable_manifest = load_json(ROOT / "plugin.json")
    assert isinstance(claude_manifest, dict)
    assert isinstance(codex_manifest, dict)
    assert isinstance(portable_manifest, dict)
    assert claude_manifest["name"] == codex_manifest["name"] == portable_manifest["name"] == "agentmailer"
    assert claude_manifest["version"] == codex_manifest["version"] == portable_manifest["version"]
    assert portable_manifest["$schema"] == PLUGIN_SCHEMA

    claude_mcp = load_json(ROOT / ".mcp.json")
    portable_mcp = load_json(ROOT / "mcp.json")
    assert claude_mcp["mcpServers"]["agentmailer"]["url"] == EXPECTED_URL
    assert portable_mcp["$schema"] == MCP_SCHEMA
    assert portable_mcp["mcpServers"]["agentmailer"] == {
        "type": "streamable-http",
        "url": EXPECTED_URL,
    }
    assert codex_manifest["mcpServers"] == "./.mcp.json"

    codex_marketplace = load_json(ROOT / ".agents/plugins/marketplace.json")
    claude_marketplace = load_json(ROOT / ".claude-plugin/marketplace.json")
    assert codex_marketplace["plugins"][0]["source"]["path"] == "."
    assert claude_marketplace["plugins"][0]["source"] == "./"
    assert claude_marketplace["plugins"][0]["version"] == portable_manifest["version"]

    pi_package = load_json(ROOT / "package.json")
    assert pi_package["name"] == "@aadi-labs/agentmailer"
    assert "pi-package" in pi_package["keywords"]
    assert pi_package["pi"]["skills"] == ["./skills"]
    assert pi_package["pi"]["image"].startswith("https://")
    assert pi_package["version"] == portable_manifest["version"]

    opencode = load_json(ROOT / "compat/opencode/opencode.json")
    assert opencode["mcp"]["agentmailer"] == {
        "type": "remote",
        "url": EXPECTED_URL,
        "enabled": True,
    }

    for skill in SKILLS:
        skill_file = ROOT / "skills" / skill / "SKILL.md"
        assert skill_file.is_file(), f"missing {skill_file.relative_to(ROOT)}"
        text = skill_file.read_text(encoding="utf-8")
        assert re.search(rf"^name:\s*{re.escape(skill)}$", text, re.MULTILINE)
        assert re.search(r"^description:\s*\S.+$", text, re.MULTILINE)
        assert "TODO" not in text

    obsolete_paths = (
        ROOT / "plugins/agentmailer/.claude-plugin/plugin.json",
        ROOT / "plugins/agentmailer/.codex-plugin/plugin.json",
        ROOT / "plugins/agentmailer/.mcp.json",
    )
    for path in obsolete_paths:
        assert not path.exists(), f"obsolete duplicate package path: {path.relative_to(ROOT)}"

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
