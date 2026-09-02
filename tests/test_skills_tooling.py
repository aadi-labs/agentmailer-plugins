from __future__ import annotations

import contextlib
import importlib.util
import io
import json
import re
import shutil
import tempfile
import unittest
from pathlib import Path


SOURCE_ROOT = Path(__file__).resolve().parents[1]


class SkillsToolingTests(unittest.TestCase):
    def setUp(self) -> None:
        self.temporary_directory = tempfile.TemporaryDirectory()
        self.repository = Path(self.temporary_directory.name) / "repository"
        (self.repository / "scripts").mkdir(parents=True)
        shutil.copy2(SOURCE_ROOT / "skills.json", self.repository / "skills.json")
        shutil.copy2(SOURCE_ROOT / "scripts/skills.py", self.repository / "scripts/skills.py")
        catalog = json.loads((SOURCE_ROOT / "skills.json").read_text(encoding="utf-8"))
        for name in (*catalog["skills"], *catalog.get("compatibilitySkills", [])):
            shutil.copytree(SOURCE_ROOT / name, self.repository / name)

        specification = importlib.util.spec_from_file_location(
            f"agentmailer_skills_{id(self)}", self.repository / "scripts/skills.py"
        )
        assert specification and specification.loader
        self.tooling = importlib.util.module_from_spec(specification)
        specification.loader.exec_module(self.tooling)

    def tearDown(self) -> None:
        self.temporary_directory.cleanup()

    def call_build(self, *, check: bool = False) -> int:
        with contextlib.redirect_stdout(io.StringIO()):
            return self.tooling.build(check=check)

    def test_build_is_deterministic_and_detects_export_drift(self) -> None:
        self.assertEqual(self.call_build(), 0)
        self.assertEqual(self.call_build(check=True), 0)

        exported = self.repository / "skills/agentmailer/SKILL.md"
        exported.write_text(exported.read_text(encoding="utf-8") + "\ndrift\n", encoding="utf-8")
        self.assertEqual(self.call_build(check=True), 1)
        self.assertEqual(self.call_build(), 0)
        self.assertEqual(self.call_build(check=True), 0)

    def test_aliases_have_their_own_skill_identity(self) -> None:
        self.assertEqual(self.call_build(), 0)
        alias = (self.repository / "agentmailer-sdk/SKILL.md").read_text(encoding="utf-8")
        self.assertIn("\nname: agentmailer-sdk\n", alias)
        self.assertNotIn("\nname: agentmailer\n", alias)
        openai = (
            self.repository / "agentmailer-sdk/agents/openai.yaml"
        ).read_text(encoding="utf-8")
        self.assertIn("$agentmailer-sdk", openai)

    def test_public_guidance_does_not_expose_backend_vendors(self) -> None:
        catalog = json.loads((SOURCE_ROOT / "skills.json").read_text(encoding="utf-8"))
        public_files = [
            SOURCE_ROOT / "README.md",
            SOURCE_ROOT / "fern/openapi/openapi.json",
            SOURCE_ROOT / "cli/cli/agentmailer/openapi0.json",
            SOURCE_ROOT / "cli/reference.md",
        ]
        for name in (*catalog["skills"], *catalog.get("compatibilitySkills", [])):
            public_files.extend((SOURCE_ROOT / name).rglob("*.md"))

        forbidden = re.compile(
            r"WorkOS|Svix|Amazon SES|AWS SES|PlanetScale|Stalwart|"
            r"Cloudflare Durable|Vercel-hosted|x-workos-permission|Create a Stripe",
            re.IGNORECASE,
        )
        leaks = []
        for path in public_files:
            match = forbidden.search(path.read_text(encoding="utf-8"))
            if match:
                leaks.append(f"{path.relative_to(SOURCE_ROOT)}: {match.group(0)}")

        self.assertEqual(leaks, [])


if __name__ == "__main__":
    unittest.main()
