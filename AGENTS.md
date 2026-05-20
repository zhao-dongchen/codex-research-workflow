# Project Constitution

This repository is a Codex-native academic research workflow scaffold. It is meant to be copied into research projects that need careful planning, reproducible execution, independent verification, and evidence-based handoff.

The scaffold is suitable for academic research projects, including economics projects with empirical code and quantitative models. It deliberately does not hard-code Stata, MATLAB, R, LaTeX, Quarto, journal, or data-source conventions. Domain-specific skills can be added later.

## Operating Principles

- Treat nontrivial tasks as plan-first work.
- Do not claim completion without evidence.
- Prefer explicit assumptions over implicit guesses.
- Preserve reproducibility: record commands, data inputs, generated outputs, and verification evidence when they matter.
- Keep research reasoning auditable: distinguish facts, assumptions, interpretations, and unresolved questions.
- Minimize unrelated changes.
- Update project memory before handoff when a session materially changes the repository or research state.

## Default Workflow

For nontrivial work, use this sequence:

1. PLAN
2. IMPLEMENT
3. VERIFY
4. REVIEW
5. FIX
6. RE-VERIFY
7. SUMMARIZE

Complex or ambiguous work may first require a requirements specification. Save substantial requirements specifications under `quality_reports/specs/`.

Approved implementation plans should be saved under `quality_reports/plans/`.

Substantial session logs, review reports, checkpoints, and onboarding reports should be saved under:

- `quality_reports/session_logs/`
- `quality_reports/reviews/`
- `quality_reports/checkpoints/`
- `quality_reports/onboarding/`

## Required Protocols

For nontrivial work, agents should consult the relevant protocol files in `workflow/` before proceeding:

- Before creating a plan, read `workflow/PLAN_PROTOCOL.md`.
- Before adapting this scaffold into an existing research project, or before creating or revising project-specific `AGENTS.md`, `PROJECT_PROFILE.md`, or initial `PROJECT_STATE.md`, read `workflow/PROJECT_ONBOARDING_PROTOCOL.md`.
- Before implementing an approved plan, read `workflow/ORCHESTRATOR_PROTOCOL.md`.
- Before working with data, logs, credentials, sensitive materials, or durable reports, read `workflow/DATA_GOVERNANCE.md`.
- Before claiming completion, read `workflow/VERIFICATION_PROTOCOL.md` and `workflow/QUALITY_GATES.md`.
- When a substantial review is requested or appropriate, read `workflow/REVIEW_PROTOCOL.md`.
- Before handoff or session close, read `workflow/MEMORY_AND_LOGGING.md`.

These protocol files define the repository’s operational workflow and should be treated as part of the project instructions.

If this scaffold has been copied into a pre-existing research project and project-specific orientation has not yet been established, agents should recommend or initiate the onboarding workflow before substantial implementation work. This should not block narrow, immediate tasks when the user explicitly asks for them.

## Project Memory

`PROJECT_STATE.md` is the checked-in handoff file. Read it before starting substantial work and update it before ending substantial work.

Use `PROJECT_STATE.md` for current status, active decisions, risks, and next actions. Use `quality_reports/` for detailed evidence, logs, specs, plans, reviews, and checkpoints.

## Subagents

Generic project-scoped Codex agents live in `.codex/agents/`:

- `research_explorer`: inspection and context gathering.
- `critical_reviewer`: adversarial review of plans, code, outputs, and reasoning.
- `verifier`: independent verification and evidence collection.

These agents are intentionally generic. Future domain-specific skills should live under `.agents/skills/` and should be added only when the project needs them.

## Completion Standard

A task is complete only when:

- The agreed scope has been addressed.
- Verification evidence has been collected or the inability to verify has been clearly explained.
- Review findings have been resolved or explicitly accepted as residual risk.
- `PROJECT_STATE.md` and relevant files under `quality_reports/` have been updated when appropriate.
- The final summary states what changed, what was verified, and what remains uncertain.
