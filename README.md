# Codex Research Workflow Scaffold

This repository is a Codex-native scaffold for academic research workflows. It gives future research projects a reusable structure for planning, implementation, verification, review, and handoff.

It is inspired by plan-first academic AI workflows, but it uses Codex-oriented conventions instead of Claude-specific project files. It is intentionally generic: no Stata, MATLAB, R, LaTeX, Quarto, journal, or data-source assumptions are built in yet.

## What This Scaffold Provides

- `AGENTS.md`: the project constitution for Codex agents.
- `PROJECT_STATE.md`: checked-in project memory and handoff state.
- `workflow/`: protocols for planning, orchestration, verification, review, quality gates, and logging.
- `templates/`: reusable templates for specs, plans, logs, reviews, and checkpoints.
- `quality_reports/`: checked-in folders for saved specs, plans, logs, reviews, and checkpoints.
- `.codex/config.toml`: minimal project-level Codex agent settings.
- `.codex/agents/`: generic read-only project agents for exploration, review, and verification.
- `.agents/skills/`: placeholder location for future domain-specific skills.

## Core Workflow

For nontrivial tasks, use a plan-first workflow:

1. Clarify requirements when the task is complex or ambiguous.
2. Save substantial requirements specs in `quality_reports/specs/`.
3. Create an execution plan and save approved plans in `quality_reports/plans/`.
4. After approval, follow:

```text
IMPLEMENT -> VERIFY -> REVIEW -> FIX -> RE-VERIFY -> SUMMARIZE
```

Completion claims should be evidence-based. A final summary should state what changed, what was verified, and what uncertainty remains.

## First Session In A New Research Project

1. Read `AGENTS.md`.
2. Read `PROJECT_STATE.md`.
3. If the task is complex or ambiguous, create a requirements spec using `templates/requirements-spec.md`.
4. Create an execution plan using `templates/execution-plan.md`.
5. Wait for plan approval before implementation when the task is nontrivial.
6. Save logs, reviews, and checkpoints under `quality_reports/` as appropriate.
7. Update `PROJECT_STATE.md` before handoff.

## Future Skills

Future domain-specific skills should be added under `.agents/skills/`. Planned examples include:

- Stata empirical-analysis workflows.
- MATLAB quantitative-model coding workflows.

Those skills are intentionally not included in this initial scaffold.

## Copying This Scaffold

To use this scaffold in another research project, copy the repository contents into the new project root, then update:

- `PROJECT_STATE.md`
- Any project-specific sections of `AGENTS.md`
- Future domain-specific skills under `.agents/skills/`, if needed

Keep the generic workflow protocols stable unless the project has a clear reason to specialize them.
