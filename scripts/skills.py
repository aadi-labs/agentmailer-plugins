#!/usr/bin/env python3
"""Build and check AgentMailer's canonical skill catalog and client export."""

from __future__ import annotations

import argparse
import json
import re
import shutil
import tempfile
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
CATALOG = json.loads((ROOT / "skills.json").read_text(encoding="utf-8"))
CANONICAL_SKILLS = tuple(CATALOG["skills"])
COMPATIBILITY_SKILLS = tuple(CATALOG.get("compatibilitySkills", []))
ALIASES = CATALOG.get("aliases", {})


def directory_files(directory: Path) -> dict[str, str]:
    if not directory.exists():
        return {}
    return {
        str(path.relative_to(directory)): path.read_text(encoding="utf-8")
        for path in sorted(directory.rglob("*"))
        if path.is_file()
    }


def render_source(name: str) -> dict[str, str]:
    files = directory_files(ROOT / name)
    if "SKILL.md" not in files:
        raise AssertionError(f"{name}/SKILL.md is missing")
    return files


def render_alias(name: str) -> dict[str, str]:
    config = ALIASES[name]
    target = config["target"]
    files = render_source(target)
    files["SKILL.md"] = re.sub(
        r"^name:\s*.*$", f"name: {name}", files["SKILL.md"], count=1, flags=re.MULTILINE
    )
    files["SKILL.md"] = re.sub(
        r"^description:\s*.*$",
        f"description: {config['description']}",
        files["SKILL.md"],
        count=1,
        flags=re.MULTILINE,
    )
    openai = files.get("agents/openai.yaml")
    if openai:
        files["agents/openai.yaml"] = openai.replace(f"${target}", f"${name}")
    return files


def exported_files() -> dict[str, str]:
    files: dict[str, str] = {}
    for name in (*CANONICAL_SKILLS, *COMPATIBILITY_SKILLS):
        for relative, content in render_source(name).items():
            files[str(Path(name) / relative)] = content
    if CATALOG["pluginExport"].get("includeAliases"):
        for name in ALIASES:
            for relative, content in render_alias(name).items():
                files[str(Path(name) / relative)] = content
    return files


def skills_sh_content() -> str:
    return json.dumps(
        {"name": "agentmailer", "skills": list(CANONICAL_SKILLS)}, indent=2
    ) + "\n"


def differences(expected: dict[str, str], actual: dict[str, str]) -> list[str]:
    return [
        relative
        for relative in sorted(set(expected) | set(actual))
        if expected.get(relative) != actual.get(relative)
    ]


def replace_tree(output: Path, expected: dict[str, str]) -> None:
    staging = Path(tempfile.mkdtemp(prefix=f".{output.name}-", dir=output.parent))
    try:
        for relative, content in expected.items():
            destination = staging / relative
            destination.parent.mkdir(parents=True, exist_ok=True)
            destination.write_text(content, encoding="utf-8")
        if output.exists():
            shutil.rmtree(output)
        staging.rename(output)
    finally:
        if staging.exists():
            shutil.rmtree(staging)


def build(check: bool = False) -> int:
    expected = exported_files()
    changed = differences(expected, directory_files(ROOT / "skills"))
    for alias in ALIASES:
        changed.extend(
            f"{alias}/{relative}"
            for relative in differences(render_alias(alias), directory_files(ROOT / alias))
        )
    expected_skills_sh = skills_sh_content()
    skills_sh = ROOT / "skills.sh.json"
    if not skills_sh.exists() or skills_sh.read_text(encoding="utf-8") != expected_skills_sh:
        changed.append("skills.sh.json")

    if check:
        if changed:
            print(f"SKILLS BUILD CHECK: {len(changed)} file(s) differ")
            for relative in changed:
                print(f" - {relative}")
            return 1
        print(
            f"SKILLS BUILD CHECK: clean ({len(CANONICAL_SKILLS)} canonical, "
            f"{len(ALIASES)} aliases)"
        )
        return 0

    replace_tree(ROOT / "skills", expected)
    for alias in ALIASES:
        replace_tree(ROOT / alias, render_alias(alias))
    skills_sh.write_text(expected_skills_sh, encoding="utf-8")
    print(
        f"SKILLS BUILD: wrote {len(CANONICAL_SKILLS)} canonical skills, "
        f"{len(COMPATIBILITY_SKILLS)} compatibility skills, and {len(ALIASES)} aliases"
    )
    return 0


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("command", choices=("build", "check"))
    args = parser.parse_args()
    raise SystemExit(build(check=args.command == "check"))


if __name__ == "__main__":
    main()
