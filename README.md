# Codex Research Workflow Scaffold

This repository is a Codex-native scaffold for academic research workflows. It provides a reusable structure
for planning, implementation, verification, review, scoring, and handoff.

The scaffold is intentionally generic. It does not hard-code Stata, MATLAB, R, LaTeX, Quarto, journal, or
data-source conventions unless a copied project adds them explicitly.

## What It Provides

- `AGENTS.md`: short top-level always-loaded project guidance.
- `PROJECT_STATE.md`: checked-in current state and handoff memory.
- `.agents/skills/`: task-specific producer and planner workflows.
- `.codex/agents/`: independent reviewers, verifiers, and explorers.
- `.codex/agents/references/`: review rubrics and subagent reference material.
- `workflow/`: optional shared protocol/reference library, not automatic Codex rules.
- `templates/`: reusable report and score templates.
- `quality_reports/`: durable plans, logs, reviews, scores, checkpoints, and onboarding reports.

## Core Workflow

For nontrivial tasks, use:

```text
PLAN -> IMPLEMENT -> VERIFY -> REVIEW -> FIX -> RE-VERIFY -> SCORE -> SUMMARIZE
```

Completion claims must be evidence-based. Do not claim verification, review, scoring, a skill, or a
subagent unless it actually ran.

The `workflow/` folder contains shared protocol/reference documents. Skills, subagents, nested `AGENTS.md`
files, or user prompts may direct Codex to read specific workflow files when relevant.

## First Session Or Onboarding

Use `$research-project-onboarding` when adapting this scaffold to an existing academic research project or
creating project-specific orientation artifacts.

Onboarding should inspect the project before editing, reconcile existing guidance rather than overwrite it
silently, and distinguish evidence-backed facts, inferences, assumptions, user-confirmed facts, and
unresolved questions.

Short prompt:

```text
Please onboard this existing academic research project using $research-project-onboarding if available.

First inspect the project without editing. Read existing guidance, code, data references, outputs, paper
files, logs, and orientation files. Infer the project structure and status, distinguish evidence from
inference and assumptions, then propose project-specific AGENTS.md, PROJECT_PROFILE.md, and
PROJECT_STATE.md updates. Do not edit files until I approve.
```

## Active Skills

- `research-project-onboarding`: onboard or Codex-enable existing academic research projects.
- `stata-data-prep-exploration`: inspect Stata data structure, keys, missingness, merges, and cleaning needs.
- `empirical-analysis-planner`: map research questions to empirical strategy, variables, outputs, and checks.
- `stata-data-analysis`: produce Stata do-files, diagnostics, logs, tables, figures, and output manifests.
- `matlab-model-planner`: plan, diagnose, and map MATLAB quantitative model design before implementation.
- `matlab-model-builder`: build or revise MATLAB model code with proportionate validation and integration checks.

Reviewers are subagents, not skills.

## Reviewer Routing

- Stata review uses `.codex/agents/stata_reviewer.toml`, which reads
  `.codex/agents/references/stata-review-protocol.md`.
- MATLAB review uses `.codex/agents/matlab_reviewer.toml`, which reads
  `.codex/agents/references/matlab-review-protocol.md`.
- `verifier` handles execution, output freshness, reproducibility, and evidence checks when available.
- `critical_reviewer` handles broader adversarial review of plans, claims, reasoning, and handoff quality.
- Review does not replace verification. Review does not replace scoring.
- Subagent review is cost-aware: use the narrowest useful reviewer and avoid unnecessary parallel review.

## Stata Workflow Prompt

```text
Please run the full empirical Stata workflow for this task.

Use stata-data-prep-exploration if raw data, sample construction, cleaning, or merges are involved. Use
empirical-analysis-planner if the empirical design is not settled. Use stata-data-analysis for implementation.

For independent Stata review, use stata_reviewer. Use verifier for output freshness and reproducibility
evidence when available. Apply the relevant score protocol or template before claiming substantial work is
complete.
```

## MATLAB Workflow Prompt

```text
Please run the full quantitative MATLAB workflow for this task.

Use matlab-model-planner for design and challenge mapping. Use matlab-model-builder for coherent whole-model
construction or revision with proportionate probes, targeted high-risk checks, and integration/sanity checks.

Use matlab_reviewer for independent MATLAB code, numerical, performance, reproducibility, and
model-consistency review. Use verifier for execution and output freshness evidence when available. Score only
after evidence, review, and verification when substantial.
```

## Lightweight Prompt

```text
Please do a lightweight pass only. Inspect, plan, or summarize the relevant project context without running
the full verify-review-score loop unless I explicitly request it.

State what you inspected, what you inferred, what remains unknown, and what full-workflow step would be needed
before implementation or completion claims.
```

## Copying This Scaffold

For a target project that already contains this scaffold, run onboarding to create or reconcile
project-specific `AGENTS.md`, `PROJECT_PROFILE.md`, and `PROJECT_STATE.md`.

For an older project without this scaffold, provide the scaffold source path or URL and ask Codex to propose
a safe import plan before copying files or changing existing guidance.
