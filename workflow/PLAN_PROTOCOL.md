# Plan Protocol

Use this protocol for nontrivial work.

## When A Plan Is Required

Create a plan before implementation when a task:

- Changes multiple files or project structure.
- Affects research outputs, empirical results, model behavior, or reproducibility.
- Has ambiguous requirements.
- Requires choosing between implementation approaches.
- Could be hard to reverse.

For simple tasks, a brief plan in the conversation may be enough. For substantial tasks, save the approved plan in `quality_reports/plans/`.

## Requirements Specs

If the goal is complex or ambiguous, create a requirements specification before the execution plan. Save substantial specs in `quality_reports/specs/`.

Use `templates/requirements-spec.md` as the starting point.

## Plan Contents

A good execution plan should state:

- Status.
- Date created.
- Objective.
- Scope and non-scope.
- Relevant files, data, artifacts, or outputs.
- Implementation steps.
- Verification steps.
- Review steps.
- Risks and assumptions.
- Acceptance criteria.
- Approval status, approval date, and approver for nontrivial plans.
- Amendments or deviations from the approved plan.
- Handoff notes.

Use `templates/execution-plan.md` as the starting point.

## Plan Status

Use simple plan statuses:

- `Draft`: proposed but not approved.
- `Approved`: accepted as the implementation reference.
- `In Progress`: implementation has started.
- `Superseded`: replaced by a newer plan.
- `Completed`: implemented, verified, reviewed as required, and summarized.

`PROJECT_STATE.md` should link the active approved plan and record its current status when substantial work is underway.

## Approval

Do not implement a nontrivial plan until it is approved by the user or project owner. Approval may be recorded from a user message, but the plan or session log should capture who approved it, when it was approved, and any later accepted deviations. Once approved, preserve the plan as the reference for implementation and verification.
