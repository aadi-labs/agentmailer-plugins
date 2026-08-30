#!/usr/bin/env python3
"""Validate the portable AgentMailer plugin package without third-party deps."""

from __future__ import annotations

import importlib.util
import json
import re
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SKILLS = (
    "agentmailer-mcp",
    "agentmailer-inbox",
    "agentmailer-email",
    "agentmailer-a2a",
)
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
        ROOT / "plugin.yaml",
        ROOT / "__init__.py",
        ROOT / "openclaw.plugin.json",
        ROOT / "openclaw/index.js",
        ROOT / "package.json",
        ROOT / "compat/hermes/config.yaml",
        ROOT / "compat/openclaw/openclaw.json",
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

    hermes_manifest = (ROOT / "plugin.yaml").read_text(encoding="utf-8")
    assert re.search(r"^name:\s*agentmailer$", hermes_manifest, re.MULTILINE)
    assert re.search(
        rf"^version:\s*{re.escape(portable_manifest['version'])}$",
        hermes_manifest,
        re.MULTILINE,
    )
    assert re.search(r"^manifest_version:\s*1$", hermes_manifest, re.MULTILINE)
    assert re.search(r"^api_version:\s*1$", hermes_manifest, re.MULTILINE)

    hermes_spec = importlib.util.spec_from_file_location(
        "agentmailer_hermes_plugin", ROOT / "__init__.py"
    )
    assert hermes_spec and hermes_spec.loader
    hermes_plugin = importlib.util.module_from_spec(hermes_spec)
    hermes_spec.loader.exec_module(hermes_plugin)

    class SkillContext:
        def __init__(self) -> None:
            self.skills: list[tuple[str, Path]] = []

        def register_skill(self, name: str, path: Path) -> None:
            self.skills.append((name, path))

    skill_context = SkillContext()
    hermes_plugin.register(skill_context)
    assert [name for name, _ in skill_context.skills] == sorted(SKILLS)
    assert all(path.is_file() for _, path in skill_context.skills)

    hermes_mcp = (ROOT / "compat/hermes/config.yaml").read_text(encoding="utf-8")
    assert "mcp_servers:" in hermes_mcp
    assert f'url: "{EXPECTED_URL}"' in hermes_mcp
    assert "auth: oauth" in hermes_mcp

    openclaw_manifest = load_json(ROOT / "openclaw.plugin.json")
    assert openclaw_manifest["id"] == portable_manifest["name"]
    assert openclaw_manifest["version"] == portable_manifest["version"]
    assert openclaw_manifest["skills"] == ["./skills"]
    assert "mcpServers" not in openclaw_manifest
    assert openclaw_manifest["activation"]["onStartup"] is False
    assert openclaw_manifest["configSchema"] == {
        "type": "object",
        "additionalProperties": False,
        "properties": {},
    }
    openclaw_config = load_json(ROOT / "compat/openclaw/openclaw.json")
    assert openclaw_config["mcp"]["servers"]["agentmailer"] == {
        "url": EXPECTED_URL,
        "transport": "streamable-http",
        "auth": "oauth",
    }

    codex_marketplace = load_json(ROOT / ".agents/plugins/marketplace.json")
    claude_marketplace = load_json(ROOT / ".claude-plugin/marketplace.json")
    assert codex_marketplace["plugins"][0]["source"]["path"] == "."
    assert claude_marketplace["plugins"][0]["source"] == "./"
    assert "version" not in claude_marketplace["plugins"][0]
    assert claude_marketplace["plugins"][0]["skills"] == "./skills/"
    assert claude_marketplace["plugins"][0]["mcpServers"] == "./.mcp.json"

    pi_package = load_json(ROOT / "package.json")
    assert pi_package["name"] == "@agentmailer/agentmailer"
    assert "pi-package" in pi_package["keywords"]
    assert pi_package["pi"]["skills"] == ["./skills"]
    assert pi_package["pi"]["image"].startswith("https://")
    assert pi_package["version"] == portable_manifest["version"]
    assert pi_package["type"] == "module"
    assert pi_package["openclaw"]["extensions"] == ["./openclaw/index.js"]
    assert pi_package["peerDependencies"]["openclaw"].startswith(">=")
    assert pi_package["peerDependenciesMeta"]["openclaw"]["optional"] is True
    for packaged_path in (
        "plugin.yaml",
        "__init__.py",
        "openclaw.plugin.json",
        "openclaw",
    ):
        assert packaged_path in pi_package["files"]

    readme = (ROOT / "README.md").read_text(encoding="utf-8")
    assert "pi install npm:@agentmailer/agentmailer" in readme
    assert "pi install git:github.com/aadi-labs/agentmailer-plugins" not in readme

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

        openai_file = ROOT / "skills" / skill / "agents" / "openai.yaml"
        assert openai_file.is_file(), f"missing {openai_file.relative_to(ROOT)}"
        openai = openai_file.read_text(encoding="utf-8")
        assert 'type: "mcp"' in openai
        assert 'value: "agentmailer"' in openai
        assert 'transport: "streamable_http"' in openai
        assert f'url: "{EXPECTED_URL}"' in openai

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
