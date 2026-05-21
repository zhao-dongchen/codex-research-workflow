#!/usr/bin/env python3
"""Validate the lean Codex research workflow scaffold."""

from __future__ import annotations

import pathlib
import re
import sys
import tomllib


ROOT = pathlib.Path(__file__).resolve().parents[1]

EXPECTED_SKILLS = {
    "research-project-onboarding",
    "stata-data-prep-exploration",
    "empirical-analysis-planner",
    "stata-data-analysis",
    "matlab-model-planner",
    "matlab-model-builder",
}

EXPECTED_SUBAGENTS = {
    "research_explorer",
    "critical_reviewer",
    "verifier",
    "stata_reviewer",
    "matlab_reviewer",
}

REMOVED_SKILL_DIRS = {
    ".agents/skills/review-stata",
    ".agents/skills/review-matlab-model",
    ".agents/skills/matlab-model-implementation",
    ".agents/skills/matlab-quantitative-modeling",
}

ACTIVE_DOCS = [
    "AGENTS.md",
    "README.md",
    "PROJECT_STATE.md",
    ".agents/skills/README.md",
    "templates",
    "workflow",
]

STALE_PATTERNS = [
    r"review-stata",
    r"Stata review skill",
    r"review rubric skill",
    r"review-matlab-model",
    r"MATLAB reviewer skill",
    r"matlab-model-implementation",
    r"matlab-quantitative-modeling",
]

ROOT_GUIDANCE_DOCS = ["AGENTS.md", "README.md", "PROJECT_STATE.md"]
MAX_ROOT_GUIDANCE_LINE = 120
MAX_ACTIVE_INSTRUCTION_LINE = 160


def rel(path: pathlib.Path) -> str:
    return str(path.relative_to(ROOT))


def fail(errors: list[str], message: str) -> None:
    errors.append(message)


def parse_simple_yaml_front_matter(
    text: str, path: pathlib.Path, errors: list[str]
) -> dict[str, str] | None:
    lines = text.splitlines()
    if not lines or lines[0] != "---":
        fail(errors, f"{rel(path)} must start with a standalone YAML front matter delimiter")
        return None

    try:
        closing_index = lines[1:].index("---") + 1
    except ValueError:
        fail(errors, f"{rel(path)} missing standalone YAML front matter closing delimiter")
        return None

    if closing_index < 2:
        fail(errors, f"{rel(path)} front matter must include name and description lines")
        return None

    first_block = "\n".join(lines[: closing_index + 1]) + "\n"
    match = re.match(r"---\n(.*?)\n---\n", first_block, re.S)
    if not match:
        fail(errors, f"{rel(path)} malformed YAML front matter")
        return None

    data: dict[str, str] = {}
    for line in match.group(1).splitlines():
        if not line.strip() or line.lstrip().startswith("#"):
            continue
        if ":" not in line:
            continue
        key, value = line.split(":", 1)
        data[key.strip()] = value.strip().strip("\"'")
    return data


def check_skill_front_matter(errors: list[str]) -> set[str]:
    skill_files = sorted((ROOT / ".agents/skills").glob("*/SKILL.md"))
    names: set[str] = set()

    for path in skill_files:
        data = parse_simple_yaml_front_matter(path.read_text(), path, errors)
        if data is None:
            continue
        for key in ("name", "description"):
            if not data.get(key):
                fail(errors, f"{rel(path)} missing front matter key: {key}")
        if data.get("name"):
            names.add(data["name"])
        if data.get("name") != path.parent.name:
            fail(errors, f"{rel(path)} name does not match directory")

    return names


def check_toml(errors: list[str]) -> set[str]:
    subagents: set[str] = set()
    paths = [ROOT / ".codex/config.toml", *sorted((ROOT / ".codex/agents").glob("*.toml"))]

    for path in paths:
        try:
            data = tomllib.loads(path.read_text())
        except Exception as exc:  # noqa: BLE001
            fail(errors, f"{rel(path)} does not parse as TOML: {exc}")
            continue

        if path.parent.name == "agents":
            for key in ("name", "description", "developer_instructions"):
                if not data.get(key):
                    fail(errors, f"{rel(path)} missing TOML key: {key}")
            if data.get("name"):
                subagents.add(data["name"])
            if data.get("name") != path.stem:
                fail(errors, f"{rel(path)} name does not match file stem")

    return subagents


def check_removed_dirs(errors: list[str]) -> None:
    for removed in sorted(REMOVED_SKILL_DIRS):
        if (ROOT / removed).exists():
            fail(errors, f"removed skill directory still exists: {removed}")


def iter_active_doc_files() -> list[pathlib.Path]:
    files: list[pathlib.Path] = []
    for item in ACTIVE_DOCS:
        path = ROOT / item
        if path.is_file():
            files.append(path)
        elif path.is_dir():
            files.extend(p for p in sorted(path.rglob("*")) if p.is_file())

    files.extend(sorted((ROOT / ".agents/skills").glob("*/SKILL.md")))
    files.extend(sorted((ROOT / ".codex/agents").glob("*.toml")))
    return sorted(set(files))


def check_stale_references(errors: list[str]) -> None:
    combined = re.compile("|".join(STALE_PATTERNS))
    for path in iter_active_doc_files():
        text = path.read_text(errors="ignore")
        for line_number, line in enumerate(text.splitlines(), 1):
            if combined.search(line):
                fail(errors, f"stale active reference in {rel(path)}:{line_number}: {line.strip()}")


def check_inventory(errors: list[str], skills: set[str], subagents: set[str]) -> None:
    if skills != EXPECTED_SKILLS:
        fail(errors, f"skill inventory mismatch: expected {sorted(EXPECTED_SKILLS)}, got {sorted(skills)}")
    if subagents != EXPECTED_SUBAGENTS:
        fail(
            errors,
            f"subagent inventory mismatch: expected {sorted(EXPECTED_SUBAGENTS)}, got {sorted(subagents)}",
        )


def check_line_lengths(errors: list[str]) -> None:
    for name in ROOT_GUIDANCE_DOCS:
        path = ROOT / name
        for line_number, line in enumerate(path.read_text().splitlines(), 1):
            if len(line) > MAX_ROOT_GUIDANCE_LINE:
                fail(errors, f"{name}:{line_number} exceeds {MAX_ROOT_GUIDANCE_LINE} chars")

    active_instruction_files = [
        *sorted((ROOT / ".agents/skills").glob("*/SKILL.md")),
        *sorted((ROOT / ".codex/agents").glob("*.toml")),
    ]
    for path in active_instruction_files:
        for line_number, line in enumerate(path.read_text().splitlines(), 1):
            if len(line) > MAX_ACTIVE_INSTRUCTION_LINE:
                fail(
                    errors,
                    f"{rel(path)}:{line_number} exceeds {MAX_ACTIVE_INSTRUCTION_LINE} chars",
                )


def main() -> int:
    errors: list[str] = []

    skills = check_skill_front_matter(errors)
    subagents = check_toml(errors)
    check_removed_dirs(errors)
    check_stale_references(errors)
    check_inventory(errors, skills, subagents)
    check_line_lengths(errors)

    if errors:
        print("Scaffold health check failed:")
        for error in errors:
            print(f"- {error}")
        return 1

    print("Scaffold health check passed.")
    print(f"Active skills: {', '.join(sorted(skills))}")
    print(f"Active subagents: {', '.join(sorted(subagents))}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
