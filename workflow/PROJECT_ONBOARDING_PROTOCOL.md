# Project Onboarding Protocol

Use this protocol when adapting this scaffold into a pre-existing academic research repository, or when creating or revising project-specific `AGENTS.md`, `PROJECT_PROFILE.md`, or initial `PROJECT_STATE.md`.

## Trigger

If this scaffold has been copied into a pre-existing research project and project-specific orientation has not yet been established, recommend or initiate onboarding before substantial implementation work.

Do not block narrow, immediate tasks that the user explicitly requests. For those tasks, complete the narrow work if it is safe, and flag missing project orientation when it affects safety, reproducibility, or interpretation.

## Read First

Before inspecting or proposing onboarding artifacts, read:

- `AGENTS.md`
- `PROJECT_STATE.md`
- `workflow/DATA_GOVERNANCE.md`
- `workflow/QUALITY_GATES.md`
- `workflow/PLAN_PROTOCOL.md`
- `workflow/MEMORY_AND_LOGGING.md`

## Inspect Existing Project Evidence

Inspect without editing:

- Existing orientation files such as `AGENTS.md`, `PROJECT_STATE.md`, `PROJECT_PROFILE.md`, `README.md`, replication notes, contributing guides, or lab/project documentation.
- Code, scripts, notebooks, models, build files, and workflow drivers.
- Paper, slides, tables, figures, appendices, and other research outputs.
- Data references, data manifests, logs, metadata, sample definitions, and access notes.
- Configuration files, environment files, package manifests, and run instructions.

Follow `workflow/DATA_GOVERNANCE.md` while inspecting. Do not copy restricted data, credentials, sensitive storage locations, or machine-specific absolute paths into durable artifacts.

## Infer Project Understanding

Use evidence to infer:

- Project purpose and research question.
- Main components and repository architecture.
- Likely code workflow and execution order.
- Relationship between code, data, paper drafts, tables, figures, and other outputs.
- Current status, active work, stale areas, and likely next steps.
- Stable project conventions.

Clearly label each point as:

- `Evidence-backed`: directly supported by inspected files.
- `Inferred`: likely from evidence but not explicitly stated.
- `Assumption`: useful working guess that needs confirmation.
- `Question`: unresolved item for the user.

## Existing Orientation Artifacts

If the target project already has `AGENTS.md`, `PROJECT_STATE.md`, `README.md`, `PROJECT_PROFILE.md`, or similar orientation files:

- Do not overwrite them silently.
- Inspect and summarize their current guidance.
- Identify conflicts with the scaffold, stale content, ambiguity, and missing orientation.
- Propose one of:
  - Merge: preserve valid existing guidance and add scaffold-compatible structure.
  - Targeted revision: update stale or incomplete sections only.
  - Reconciliation: surface conflicting guidance and ask the user to decide.

The onboarding report must explain the proposed strategy before any edits are made.

## Pre-Edit Onboarding Report

Before creating or modifying onboarding artifacts, prepare a report using `templates/project-onboarding-report.md`.

Save substantial reports under `quality_reports/onboarding/` when appropriate.

The report should include proposed content for:

- Project-specific `AGENTS.md` guidance.
- `PROJECT_PROFILE.md`.
- Initial or updated `PROJECT_STATE.md`.

The report must also list unresolved questions and identify what is evidence-backed, inferred, assumed, or user-confirmed.

## Approval Required

Do not create or modify `AGENTS.md`, `PROJECT_PROFILE.md`, `PROJECT_STATE.md`, or other onboarding artifacts until the user approves the onboarding report or an implementation plan derived from it.

After approval, make only the approved changes, then verify:

- Existing guidance was preserved, merged, or revised according to the approved strategy.
- `PROJECT_PROFILE.md` or equivalent orientation exists.
- `PROJECT_STATE.md` reflects current project status.
- Inferences, assumptions, and unresolved questions remain visible.
- Data governance rules were followed.
