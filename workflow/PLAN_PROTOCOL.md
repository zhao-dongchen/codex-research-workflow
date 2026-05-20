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

- Objective.
- Scope and non-scope.
- Relevant files, data, artifacts, or outputs.
- Implementation steps.
- Verification steps.
- Review steps.
- Risks and assumptions.
- Acceptance criteria.
- Handoff notes.

Use `templates/execution-plan.md` as the starting point.

## Approval

Do not implement a nontrivial plan until it is approved by the user or project owner. Once approved, preserve the plan as the reference for implementation and verification.
