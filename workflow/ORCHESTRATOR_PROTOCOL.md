# Orchestrator Protocol

The orchestrator is the main agent responsible for keeping the task coherent from start to finish.

## Responsibilities

- Read `AGENTS.md`, `PROJECT_STATE.md`, and relevant workflow protocols.
- Clarify requirements when needed.
- Create and save plans for nontrivial work.
- Coordinate implementation, verification, review, fixes, and handoff.
- Keep changes scoped to the approved plan.
- Update `PROJECT_STATE.md` after meaningful milestones.

## Subagent Use

Use project-scoped subagents when their read-only roles help:

- `research_explorer`: map files, inspect context, summarize prior work, identify relevant evidence.
- `verifier`: independently check outputs, commands, artifacts, or reproducibility evidence.
- `critical_reviewer`: challenge assumptions, look for correctness issues, and identify missing evidence.

Subagents should receive concrete tasks and should report evidence, uncertainty, and recommended next steps. The orchestrator remains responsible for final decisions and integration.

## Default Execution Loop

After plan approval, use:

```text
IMPLEMENT -> VERIFY -> REVIEW -> FIX -> RE-VERIFY -> SUMMARIZE
```

Do not skip verification or review for substantial work unless the user explicitly narrows the task.

## Handoff

Before ending substantial work:

- Summarize completed work.
- Record verification evidence.
- Record unresolved issues.
- Update `PROJECT_STATE.md`.
- Save detailed logs or checkpoints under `quality_reports/` when useful.
