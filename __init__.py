"""Native Hermes Agent registration for the AgentMailer skills."""

from pathlib import Path


def register(ctx):
    """Register each bundled AgentMailer skill in the Hermes namespace."""
    skills_dir = Path(__file__).parent / "skills"
    for child in sorted(skills_dir.iterdir()):
        skill_md = child / "SKILL.md"
        if child.is_dir() and skill_md.is_file():
            ctx.register_skill(child.name, skill_md)
