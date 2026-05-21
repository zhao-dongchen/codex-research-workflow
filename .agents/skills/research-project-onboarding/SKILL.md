---
name: research-project-onboarding
description: "Onboard or Codex-enable an existing academic research project."
---

# Research Project Onboarding

Use this skill to plan and execute evidence-based onboarding for an existing academic research project.
The workflow is plan-first: inspect before editing, propose before modifying, and keep facts, inferences,
assumptions, confirmations, and unresolved questions visibly separate.

## Core Rules

- Do not edit files until the user approves an onboarding report or implementation plan.
- Do not silently overwrite `README.md`, `AGENTS.md`, `PROJECT_STATE.md`, `PROJECT_PROFILE.md`, notes,
  replication docs, or other orientation files.
- Preserve valid existing guidance and identify conflicts before proposing merges or replacements.
- Follow local repository instructions and protocols when they exist.
- Follow data governance rules while inspecting data references, logs, credentials, sensitive materials,
  and durable reports.
- Keep onboarding separate from substantive research implementation unless the user explicitly approves that next phase.

## Scenario A: Scaffold Already Present

Use this path when the target project already contains this workflow scaffold, such as `AGENTS.md`,
`PROJECT_STATE.md`, `workflow/`, `templates/`, `quality_reports/`, and `.codex/`.

1. Read the project's `AGENTS.md`, `PROJECT_STATE.md`, relevant workflow guidance, and any existing
   `PROJECT_PROFILE.md`.
2. Follow the repository's onboarding protocol if present, especially `workflow/PROJECT_ONBOARDING_PROTOCOL.md`.
3. Inspect existing documentation, code, notebooks, model files, build scripts, outputs, data references,
   paper files, logs, configuration, and orientation artifacts.
4. Identify existing `README.md`, `AGENTS.md`, `PROJECT_STATE.md`, `PROJECT_PROFILE.md`, replication notes,
   contributing guides, lab notes, or similar files.
5. Produce an onboarding report and implementation plan before editing.
6. Propose how to create or reconcile:
   - project-specific `AGENTS.md`;
   - `PROJECT_PROFILE.md`;
   - `PROJECT_STATE.md`.
7. Require user approval before modifications.

## Scenario B: Scaffold Not Yet Present

Use this path when the target project is an old or ongoing academic research project that does not yet contain
this workflow scaffold.

1. State that the project has not yet been onboarded into this workflow system.
2. Do not assume `AGENTS.md`, `PROJECT_STATE.md`, `workflow/`, `templates/`, `quality_reports/`,
   `.codex/`, or this skill already exist in the target project.
3. Distinguish between two requests:
   - File-level scaffold import or adaptation: the user wants this specific scaffold integrated into the
     project.
   - Onboarding-only guidance: the user wants inspection and project-orientation guidance without exact
     scaffold file import.
4. For file-level scaffold import or adaptation, require a scaffold source such as a local path or GitHub URL
   before claiming an exact file-level integration plan is possible.
5. If no scaffold source is provided for file-level import, ask the user for the source before producing the
   exact integration plan.
6. If the user only wants onboarding guidance and not file-level scaffold import, proceed from this skill's
   onboarding logic and state that no exact scaffold file plan is being claimed.
7. Inspect the target project without editing files.
8. If a scaffold source path or GitHub URL is provided, inspect the scaffold source conceptually and as
   specifically as available.
9. Propose a safe plan to integrate or adapt the scaffold without silently overwriting existing `README.md`,
   `AGENTS.md`, `PROJECT_STATE.md`, notes, or orientation files.
10. After the scaffold integration plan, propose the subsequent onboarding step that will generate or reconcile:
    - project-specific `AGENTS.md`;
    - `PROJECT_PROFILE.md`;
    - `PROJECT_STATE.md`.
11. Require user approval before any modifications.

## Evidence Discipline

In reports, plans, and summaries, separate:

- `Evidence-backed`: facts directly supported by inspected files.
- `Inferred`: likely conclusions from evidence, but not explicitly stated.
- `Assumption`: working guesses that need confirmation.
- `User-confirmed`: facts the user explicitly confirmed.
- `Question`: unresolved items needing user input.

Do not promote inferences or assumptions into project guidance as settled facts unless the user confirms
them or the files support them.

## Subagent Integration

Use project-scoped agents only when they are available and when the user's prompt explicitly requests full
onboarding support. Do not imply that subagents are silently guaranteed to run.

- Use `research_explorer` for repository mapping and orientation discovery.
- Use `critical_reviewer` to audit the onboarding proposal, merge or reconciliation strategy, and potential
  risks.
- Use `verifier` after approved implementation to check whether onboarding artifacts and documentation match
  the approved plan.

If those agents are not available in the target repo, proceed in single-agent mode and state that explicitly.

## Pre-Edit Outputs

Before edits, produce:

- An onboarding report.
- Proposed artifact contents or structures.
- An implementation plan.
- User-confirmation questions where necessary.

The report and plan should explain how existing orientation artifacts will be preserved, merged, revised, or reconciled.

## Post-Implementation Verification

After approved implementation, verify:

- Files created or updated.
- No silent overwrite occurred.
- Guidance files are internally consistent.
- `PROJECT_STATE.md` reflects confirmed status, assumptions, and unresolved questions.
- The final summary states what changed, what was verified, and what remains uncertain.
