# Orchestrator Protocol

The orchestrator is the main agent responsible for keeping the task coherent from start to finish.

## Responsibilities

- Read `AGENTS.md`, `PROJECT_STATE.md`, and relevant workflow protocols.
- Clarify requirements when needed.
- Create and save plans for nontrivial work.
- Coordinate implementation, verification, review, fixes, and handoff.
- Apply the quality-score protocol for substantial research-code or research-output tasks.
- Keep changes scoped to the approved plan.
- Update `PROJECT_STATE.md` after meaningful milestones.

## Subagent Use

Use project-scoped subagents when the user requests independent or parallel work, or when the active runtime explicitly authorizes delegation for the task:

- `research_explorer`: map files, inspect context, summarize prior work, identify relevant evidence.
- `verifier`: independently check outputs, commands, artifacts, or reproducibility evidence.
- `critical_reviewer`: challenge assumptions, look for correctness issues, and identify missing evidence.
- `stata_reviewer`: independently review Stata empirical pipelines, outputs, and reproducibility evidence using the `review-stata` rubric.

Subagents should receive concrete tasks and should report evidence, uncertainty, and recommended next steps. Do not imply a subagent ran unless it actually ran. The orchestrator remains responsible for final decisions and integration.

Reviewer-specific knowledge should live in skills or protocols where possible. For example, `review-stata` is the review rubric, while `stata_reviewer` is the read-only actor that applies it independently.

## Default Execution Loop

After plan approval, use:

```text
IMPLEMENT -> VERIFY -> REVIEW -> FIX -> RE-VERIFY -> SCORE -> SUMMARIZE
```

Do not skip verification or review for substantial work unless the user explicitly narrows the task.

If a quality score is below the threshold in `workflow/QUALITY_SCORE_PROTOCOL.md`, run bounded fix/review loops rather than editing indefinitely. If the loop limit is reached, stop and report the remaining blockers and decision needed.

## Stata Auto-Flow

For Stata datawork, use this default routing:

1. Use `stata-data-prep-exploration` when the data structure, unit, keys, missingness, or sample is not yet understood.
2. Use `empirical-analysis-planner` when the empirical goal needs a specification, variable, sample, table, or robustness plan.
3. Use `stata-data-analysis` to implement code, diagnostics, logs, tables, figures, and output manifests.
4. Use `verifier` for independent evidence checks when authorized and available.
5. Use `stata_reviewer` for independent Stata review when authorized and available; otherwise apply the `review-stata` rubric and label the review as not independent.
6. Fix findings, re-verify, score, and summarize evidence and residual risks.

## Handoff

Before ending substantial work:

- Summarize completed work.
- Record verification evidence.
- Record score status when scoring applies.
- Record unresolved issues.
- Update `PROJECT_STATE.md`.
- Save detailed logs, reviews, score reports, or checkpoints under `quality_reports/` when useful.
