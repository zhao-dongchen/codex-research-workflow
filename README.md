# Codex Research Workflow Scaffold

This repository is a Codex-native scaffold for academic research workflows. It gives future research projects a reusable structure for planning, implementation, verification, review, scoring, and handoff.

It is intentionally generic: no Stata, MATLAB, R, LaTeX, Quarto, journal, or data-source assumptions are built in unless a copied project adds them explicitly.

## What This Scaffold Provides

- `AGENTS.md`: short top-level always-loaded project guidance.
- `PROJECT_STATE.md`: checked-in project memory and handoff state.
- `.agents/skills/`: task-specific reusable procedures, with local references, scripts, or assets when needed.
- `.codex/agents/`: independent reviewers, verifiers, explorers, and other project-scoped subagents.
- `.codex/agents/references/`: reference material for subagents, including the Stata review protocol.
- `workflow/`: optional shared protocol/reference library, not automatic Codex rules.
- `templates/`: reusable templates for specs, plans, logs, reviews, score reports, and checkpoints.
- `quality_reports/`: saved plans, logs, reviews, scores, checkpoints, onboarding reports, and other durable evidence.
- `.codex/config.toml`: minimal project-level Codex settings.

## Core Workflow

For nontrivial tasks, use a plan-first workflow:

```text
PLAN -> IMPLEMENT -> VERIFY -> REVIEW -> FIX -> RE-VERIFY -> SCORE -> SUMMARIZE
```

Completion claims should be evidence-based. Do not claim that verification, review, scoring, a skill, or a subagent was used unless it actually was. In full workflow mode, substantial research-code and research-output tasks should be scored with the relevant shared score protocol or template before completion is claimed.

The `workflow/` folder contains shared protocol/reference documents. It is not an automatic rule mechanism; skills, subagents, nested `AGENTS.md` files, or user prompts may direct Codex to read specific workflow files when relevant.

## First Session In A New Research Project

1. Read `AGENTS.md`.
2. Read `PROJECT_STATE.md`.
3. Establish project basics: research objective, project type, data access class and storage convention, software/runtime expectations, reproducibility target, output-location convention, collaboration rules, and known constraints.
4. Use `$research-project-onboarding` when onboarding or Codex-enabling an existing academic research project.
5. Save logs, reviews, score reports, and checkpoints under `quality_reports/` as appropriate.
6. Update `PROJECT_STATE.md` before handoff when the work materially changes project state.

## Using This Scaffold With An Existing Research Project

For a pre-existing research repository, use onboarding before substantial Codex-assisted implementation. Onboarding means Codex first inspects the existing project, infers what the project is about, reviews current orientation files, and proposes project-specific guidance before editing anything.

The goal is to create or reconcile:

- Project-specific `AGENTS.md` guidance.
- A stable `PROJECT_PROFILE.md`.
- An initial or updated `PROJECT_STATE.md`.
- A record of what is evidence-backed, inferred, assumed, user-confirmed, or unresolved.

### Case A: The Scaffold Is Already Present

Use this path when the target project already contains this workflow scaffold, including files and folders such as `AGENTS.md`, `PROJECT_STATE.md`, `workflow/`, `templates/`, `quality_reports/`, and `.codex/`.

Copy-paste prompt:

```text
Please onboard this existing academic research project using the repository workflow.

Use $research-project-onboarding if it is available.

First, inspect the project deeply without editing files. Read the scaffold guidance, then inspect existing documentation, code, data references, outputs, paper files, logs, configuration, and any existing orientation files such as AGENTS.md, PROJECT_STATE.md, README.md, or PROJECT_PROFILE.md.

If research_explorer, critical_reviewer, and verifier are available, use them for the full onboarding workflow: research_explorer for repository mapping and orientation discovery, critical_reviewer for auditing the onboarding proposal and reconciliation risks, and verifier after approved implementation to check that the artifacts match the plan.

Infer what the project is about, how the repository is organized, how code relates to data and paper outputs, and what the current status appears to be. Clearly distinguish evidence-backed facts, inferences, assumptions, user-confirmed facts, and unresolved questions.

If existing orientation files are present, do not overwrite them silently. Review them and propose a merge, targeted revision, or reconciliation strategy. Surface conflicts, stale guidance, ambiguity, and questions for me.

Produce a project onboarding report and an implementation plan proposing project-specific AGENTS.md guidance, PROJECT_PROFILE.md content, and PROJECT_STATE.md content. Do not edit anything until I approve the plan.
```

### Case B: The Scaffold Is Not Yet Present

Use this path when the target project is an old or ongoing research project that does not yet contain this workflow infrastructure. Codex should inspect the target project and the scaffold source, then propose how to import or adapt the scaffold without silently overwriting existing orientation files.

Copy-paste prompt:

```text
Please help adapt/import a Codex research workflow scaffold into this existing academic research project.

Scaffold source: [LOCAL PATH OR GITHUB URL]

Use $research-project-onboarding if it is available. If that skill is not available in this target project, proceed using the onboarding instructions in this prompt directly; do not assume the skill is installed.

First, inspect this target research project deeply without editing files. Then inspect the scaffold source. If no scaffold source is provided and I am asking for exact file-level scaffold integration, ask me for the source before claiming you can produce an exact file-level integration plan.

If research_explorer, critical_reviewer, and verifier are available, use them for the full onboarding workflow: research_explorer for repository mapping and orientation discovery, critical_reviewer for auditing the scaffold-integration proposal, and verifier after approved implementation to check that the artifacts match the plan.

Propose an integration plan to add or adapt the workflow scaffold safely without silently overwriting existing README.md, AGENTS.md, PROJECT_STATE.md, notes, or other orientation files. Do not edit anything until I approve.
```

## Full Workflow Prompts

### Full Empirical / Stata Workflow

```text
Please run the full empirical Stata workflow for this task.

Follow the repository loop:

PRE-EXPLORE -> PLAN -> IMPLEMENT -> VERIFY -> REVIEW -> FIX -> RE-VERIFY -> SCORE -> SUMMARIZE

Use `stata-data-prep-exploration` when raw data, sample construction, cleaning, or merges are involved. Use `empirical-analysis-planner` if the empirical design is not settled. Use `stata-data-analysis` for implementation, including do-file changes, regressions, tables, figures, logs, and output documentation.

For independent Stata review, use the `stata_reviewer` subagent. The reviewer reads `.codex/agents/references/stata-review-protocol.md`. Stata review is not a skill. The Stata producer skill may request review, but it does not review itself independently. If the main agent applies the Stata review protocol itself, label that review non-independent. Use `verifier` when authorized and available for output freshness, reproducibility, and evidence checks. Before claiming completion, apply the relevant score protocol or template when the task is substantial.

Do not claim that a skill or subagent was used unless it actually was. Distinguish direct execution evidence from inference, and clearly report blockers, remaining risks, and any below-threshold override needed.
```

### Full Quantitative / MATLAB Workflow

```text
Please run the full quantitative MATLAB workflow for this task.

Follow the repository loop:

PRE-EXPLORE -> PLAN -> IMPLEMENT -> VERIFY -> REVIEW -> FIX -> RE-VERIFY -> SCORE -> SUMMARIZE

Use `matlab-quantitative-modeling` as the compatibility entrypoint if named, and route actual production work to `matlab-model-implementation` for model-code implementation or revision. Use `review-matlab-model` as the MATLAB model-review rubric and use `critical_reviewer` when authorized and available for independent review. Use `verifier` when authorized and available for execution evidence, output consistency, reproducibility, and freshness checks.

Do not change model timing, equations, constraints, calibration targets, moments, simulation logic, or output interpretation silently. Distinguish direct execution evidence from inference, and clearly report blockers, remaining risks, and any below-threshold override needed.
```

### Lightweight Inspection Or Planning Workflow

```text
Please do a lightweight pass only. Inspect, plan, or summarize the relevant project context without running the full verify-review-score loop unless I explicitly request it.

State what you inspected, what you inferred, what remains unknown, and what next full-workflow step would be needed before implementation or completion claims.
```

## Included Skills

Reusable skills may be added under `.agents/skills/` when a project has a recurring need. Current skills include:

- `research-project-onboarding`: existing-project onboarding and scaffold integration.
- `stata-data-prep-exploration`: Stata data orientation, missingness, keys, merges, and minimal cleaning plans.
- `empirical-analysis-planner`: empirical strategy planning from available project and data evidence.
- `stata-data-analysis`: Stata producer skill for empirical analysis code, diagnostics, logs, tables, figures, and output manifests.
- `matlab-model-implementation`: MATLAB producer/modifier skill for quantitative economic model code.
- `review-matlab-model`: read-only MATLAB model reviewer skill for economic correctness, numerical correctness, downstream consistency, performance, memory, and readability.
- `matlab-quantitative-modeling`: temporary compatibility pointer to the MATLAB producer and reviewer skills.

## Reviewer Routing

- Stata review is performed by `.codex/agents/stata_reviewer.toml`.
- `stata_reviewer` reads `.codex/agents/references/stata-review-protocol.md`.
- Stata review is not a skill.
- The Stata producer skill may request review, but does not review itself independently.
- The `verifier` subagent handles output, log, freshness, and reproducibility evidence when available.
- Review does not replace verification. Review does not replace scoring.

## Copying This Scaffold

To use this scaffold in another research project, choose the path that matches the target:

- For a project where this scaffold is already present, use Case A onboarding to generate or reconcile project-specific `AGENTS.md`, `PROJECT_PROFILE.md`, and `PROJECT_STATE.md`.
- For an old or ongoing project where this scaffold is not yet present, use Case B scaffold integration. Provide a local scaffold path or GitHub URL, then have Codex propose a safe import/adaptation plan before any files are copied or changed.

Keep shared workflow protocols stable unless the project has a clear reason to specialize them.
