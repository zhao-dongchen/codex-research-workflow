# Codex Research Workflow Scaffold

This repository is a Codex-native scaffold for academic research workflows. It gives future research projects a reusable structure for planning, implementation, verification, review, and handoff.

It is inspired by plan-first academic AI workflows, but it uses Codex-oriented conventions instead of Claude-specific project files. It is intentionally generic: no R, LaTeX, Quarto, journal, or data-source assumptions are built in.

## What This Scaffold Provides

- `AGENTS.md`: the project constitution for Codex agents.
- `PROJECT_STATE.md`: checked-in project memory and handoff state.
- `workflow/`: protocols for planning, orchestration, verification, review, quality gates, and logging.
- `templates/`: reusable templates for specs, plans, logs, reviews, score reports, and checkpoints.
- `quality_reports/`: checked-in folders for saved specs, plans, logs, reviews, scores, checkpoints, and onboarding reports.
- `.codex/config.toml`: minimal project-level Codex agent settings.
- `.codex/agents/`: read-only project agents for exploration, review, verification, and Stata review.
- `.agents/skills/`: reusable workflow-step skills, including Stata datawork and MATLAB quantitative modeling.

## Core Workflow

For nontrivial tasks, use a plan-first workflow:

1. Clarify requirements when the task is complex or ambiguous.
2. Save substantial requirements specs in `quality_reports/specs/`.
3. Create an execution plan and save approved plans in `quality_reports/plans/`.
4. After approval, follow the full workflow when requested:

```text
PLAN -> IMPLEMENT -> VERIFY -> REVIEW -> FIX -> RE-VERIFY -> SCORE -> SUMMARIZE
```

Completion claims should be evidence-based. In full workflow mode, `SCORE` is not optional: substantial research-code and research-output tasks should be scored with `workflow/QUALITY_SCORE_PROTOCOL.md` before completion is claimed. Below-threshold work should stop with blockers and residual risk rather than endless editing. A final summary should state what changed, what was verified, what review evidence exists, what score or threshold decision applied, and what uncertainty remains.

## First Session In A New Research Project

1. Read `AGENTS.md`.
2. Read `PROJECT_STATE.md`.
3. Establish the new-project basics before substantive research work: research objective, project type, data access class and storage/location convention, software/runtime expectations, reproducibility target, intended output registry or output-location convention, collaboration rules if relevant, and known constraints.
4. If the task is complex or ambiguous, create a requirements spec using `templates/requirements-spec.md`.
5. Create an execution plan using `templates/execution-plan.md`.
6. Wait for plan approval before implementation when the task is nontrivial.
7. Save logs, reviews, score reports, and checkpoints under `quality_reports/` as appropriate.
8. Update `PROJECT_STATE.md` before handoff.

## Using This Scaffold With An Existing Research Project

For a pre-existing research repository, use onboarding before substantial Codex-assisted implementation. Onboarding means Codex first inspects the existing project, infers what the project is about, reviews any current orientation files, and proposes project-specific guidance before editing anything.

The goal is to create or reconcile:

- Project-specific `AGENTS.md` guidance.
- A stable `PROJECT_PROFILE.md`.
- An initial or updated `PROJECT_STATE.md`.
- A record of what is evidence-backed, inferred, assumed, user-confirmed, or unresolved.

### Case A: The Scaffold Is Already Present

Use this path when the target project already contains this workflow scaffold, including files and folders such as `AGENTS.md`, `PROJECT_STATE.md`, `workflow/`, `templates/`, `quality_reports/`, and `.codex/`.

In this case, keep the existing onboarding logic. Codex should run the onboarding workflow to inspect the project and generate or reconcile project-specific `AGENTS.md`, `PROJECT_PROFILE.md`, and `PROJECT_STATE.md` content. If the project already has `AGENTS.md`, `PROJECT_STATE.md`, `README.md`, `PROJECT_PROFILE.md`, or similar documentation, Codex should inspect those files and propose a merge, targeted revision, or reconciliation strategy. It should not overwrite existing guidance silently.

Copy-paste prompt for first onboarding when the scaffold is already present:

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

Use this path when the target project is an old or ongoing research project that does not yet contain this workflow infrastructure. This is the scaffold-integration case: Codex should inspect the target project and the scaffold source, then propose how to import or adapt the scaffold without silently overwriting existing `README.md`, `AGENTS.md`, `PROJECT_STATE.md`, notes, or other orientation files.

If `$research-project-onboarding` is available, use it. If it is not available in the target project, Codex should proceed from the prompt's onboarding instructions directly and propose a safe scaffold-integration plan without assuming the skill is installed. This distinction matters because a repo-scoped skill from this scaffold will not automatically exist inside an unrelated pre-existing project unless it has been installed or copied at user scope, or otherwise made available.

For exact file-level scaffold integration, provide the scaffold source as a local path or GitHub URL. If no scaffold source is provided, Codex should ask for one before claiming it can produce an exact file-level integration plan. If the goal is only onboarding guidance rather than file-level scaffold import, Codex may proceed from the onboarding logic directly, but it should state that distinction clearly.

Copy-paste prompt for integrating this scaffold into an existing project:

```text
Please help adapt/import a Codex research workflow scaffold into this existing academic research project.

Scaffold source: [LOCAL PATH OR GITHUB URL]

Use $research-project-onboarding if it is available. If that skill is not available in this target project, proceed using the onboarding instructions in this prompt directly; do not assume the skill is installed.

First, inspect this target research project deeply without editing files. Then inspect the scaffold source, using the local path or GitHub URL above. If no scaffold source is provided and I am asking for exact file-level scaffold integration, ask me for the source before claiming you can produce an exact file-level integration plan. If I only want onboarding guidance rather than file-level scaffold import, state that distinction and proceed from the onboarding logic directly.

If research_explorer, critical_reviewer, and verifier are available, use them for the full onboarding workflow: research_explorer for repository mapping and orientation discovery, critical_reviewer for auditing the scaffold-integration proposal, merge/reconciliation strategy, and risks, and verifier after approved implementation to check that the artifacts match the plan.

Propose an integration plan to add or adapt the workflow scaffold safely without silently overwriting existing README.md, AGENTS.md, PROJECT_STATE.md, notes, or other orientation files. After the scaffold integration plan, propose the subsequent onboarding process that will generate or reconcile project-specific AGENTS.md, PROJECT_PROFILE.md, and PROJECT_STATE.md.

Clearly separate evidence-backed facts from files, inferences, assumptions, user-confirmed facts, and unresolved questions. Produce the onboarding report, proposed artifact contents or structures, implementation plan, and user-confirmation questions where needed. Do not edit anything until I approve.
```

Short refresh prompt for an already onboarded project:

```text
Please refresh this project's onboarding state. Use $research-project-onboarding if it is available. Inspect the current repository structure, project profile, project state, agent guidance, and recent outputs without editing files. Identify what changed, what appears stale, and what needs user confirmation. Propose updates to AGENTS.md, PROJECT_PROFILE.md, and PROJECT_STATE.md, but do not edit anything until I approve.
```

## Full Workflow Prompts

Use these prompts when you want the whole scaffold loop rather than a lightweight inspection.

### Full Empirical / Stata Workflow

```text
Please run the full empirical Stata workflow for this task.

Follow the repository loop:

PRE-EXPLORE -> PLAN -> IMPLEMENT -> VERIFY -> REVIEW -> FIX -> RE-VERIFY -> SCORE -> SUMMARIZE

Use `stata-data-prep-exploration` when raw data, sample construction, cleaning, or merges are involved. Use `empirical-analysis-planner` if the empirical design is not settled. Use `stata-data-analysis` for implementation, including do-file changes, regressions, tables, figures, logs, and output documentation.

For review, use `review-stata` as the rubric and use `stata_reviewer` when authorized and available for independent Stata review. Use `verifier` when authorized and available for output freshness, reproducibility, and evidence checks. Before claiming completion, apply `workflow/QUALITY_SCORE_PROTOCOL.md` and save a score report under `quality_reports/scores/` when the task is substantial.

Do not claim that a skill or subagent was used unless it actually was. Distinguish direct execution evidence from inference, and clearly report blockers, remaining risks, and any below-threshold override needed.
```

### Full Quantitative / MATLAB Workflow

```text
Please run the full quantitative MATLAB workflow for this task.

Follow the repository loop:

PRE-EXPLORE -> PLAN -> IMPLEMENT -> VERIFY -> REVIEW -> FIX -> RE-VERIFY -> SCORE -> SUMMARIZE

Use `matlab-quantitative-modeling` as the compatibility entrypoint if named, and route actual production work to `matlab-model-implementation` for model-code implementation or revision. Use `review-matlab-model` as the MATLAB model-review rubric and use `critical_reviewer` when authorized and available for independent review. Use `verifier` when authorized and available for execution evidence, output consistency, reproducibility, and freshness checks.

Before claiming completion, apply `workflow/QUALITY_SCORE_PROTOCOL.md` and use `templates/matlab-quality-score-report.md` for substantial model-code or model-output work.

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
- `review-stata`: Stata review rubric for empirical pipelines, outputs, and reproducibility. Prefer the `stata_reviewer` subagent as the independent actor when authorized and available.
- `matlab-model-implementation`: MATLAB producer/modifier skill for quantitative economic model code.
- `review-matlab-model`: read-only MATLAB model reviewer skill for economic correctness, numerical correctness, downstream consistency, performance, memory, and readability.
- `matlab-quantitative-modeling`: temporary compatibility pointer to the MATLAB producer and reviewer skills.

Stata review is split into a reusable rubric skill (`review-stata`) and an independent read-only reviewer actor (`.codex/agents/stata_reviewer.toml`). MATLAB currently keeps its existing producer/reviewer skill split. `matlab-quantitative-modeling` is retained temporarily for compatibility and may be removed after real-use testing.

## Copying This Scaffold

To use this scaffold in another research project, choose the path that matches the target:

- For a project where this scaffold is already present, use Case A onboarding to generate or reconcile project-specific `AGENTS.md`, `PROJECT_PROFILE.md`, and `PROJECT_STATE.md`.
- For an old or ongoing project where this scaffold is not yet present, use Case B scaffold integration. Provide a local scaffold path or GitHub URL, then have Codex propose a safe import/adaptation plan before any files are copied or changed.

Keep the generic workflow protocols stable unless the project has a clear reason to specialize them.
