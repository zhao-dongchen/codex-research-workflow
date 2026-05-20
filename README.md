# Codex Research Workflow Scaffold

This repository is a Codex-native scaffold for academic research workflows. It gives future research projects a reusable structure for planning, implementation, verification, review, and handoff.

It is inspired by plan-first academic AI workflows, but it uses Codex-oriented conventions instead of Claude-specific project files. It is intentionally generic: no Stata, MATLAB, R, LaTeX, Quarto, journal, or data-source assumptions are built in yet.

## What This Scaffold Provides

- `AGENTS.md`: the project constitution for Codex agents.
- `PROJECT_STATE.md`: checked-in project memory and handoff state.
- `workflow/`: protocols for planning, orchestration, verification, review, quality gates, and logging.
- `templates/`: reusable templates for specs, plans, logs, reviews, and checkpoints.
- `quality_reports/`: checked-in folders for saved specs, plans, logs, reviews, checkpoints, and onboarding reports.
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
3. Establish the new-project basics before substantive research work: research objective, project type, data access class and storage/location convention, software/runtime expectations, reproducibility target, intended output registry or output-location convention, collaboration rules if relevant, and known constraints.
4. If the task is complex or ambiguous, create a requirements spec using `templates/requirements-spec.md`.
5. Create an execution plan using `templates/execution-plan.md`.
6. Wait for plan approval before implementation when the task is nontrivial.
7. Save logs, reviews, and checkpoints under `quality_reports/` as appropriate.
8. Update `PROJECT_STATE.md` before handoff.

## Using This Scaffold With An Existing Research Project

For a pre-existing research repository, use onboarding before substantial Codex-assisted implementation. Onboarding means Codex first inspects the existing project, infers what the project is about, reviews any current orientation files, and proposes project-specific guidance before editing anything.

The goal is to create or reconcile:

- Project-specific `AGENTS.md` guidance.
- A stable `PROJECT_PROFILE.md`.
- An initial or updated `PROJECT_STATE.md`.
- A record of what is evidence-backed, inferred, assumed, user-confirmed, or unresolved.

If the existing project already has `AGENTS.md`, `PROJECT_STATE.md`, `README.md`, `PROJECT_PROFILE.md`, or similar documentation, Codex should inspect those files and propose a merge, targeted revision, or reconciliation strategy. It should not overwrite existing guidance silently.

Copy-paste prompt for first onboarding:

```text
Please onboard this existing academic research project using the repository workflow.

First, inspect the project deeply without editing files. Read the scaffold guidance, then inspect existing documentation, code, data references, outputs, paper files, logs, configuration, and any existing orientation files such as AGENTS.md, PROJECT_STATE.md, README.md, or PROJECT_PROFILE.md.

Infer what the project is about, how the repository is organized, how code relates to data and paper outputs, and what the current status appears to be. Clearly distinguish evidence-backed facts, inferences, assumptions, user-confirmed facts, and unresolved questions.

If existing orientation files are present, do not overwrite them silently. Review them and propose a merge, targeted revision, or reconciliation strategy. Surface conflicts, stale guidance, ambiguity, and questions for me.

Produce a project onboarding report and an implementation plan proposing project-specific AGENTS.md guidance, PROJECT_PROFILE.md content, and PROJECT_STATE.md content. Do not edit anything until I approve the plan.
```

Short refresh prompt for an already onboarded project:

```text
Please refresh this project's onboarding state. Inspect the current repository structure, project profile, project state, agent guidance, and recent outputs without editing files. Identify what changed, what appears stale, and what needs user confirmation. Propose updates to AGENTS.md, PROJECT_PROFILE.md, and PROJECT_STATE.md, but do not edit anything until I approve.
```

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
