# Memory And Logging

This repository uses checked-in memory and report artifacts so future agents and humans can understand project state.

## `PROJECT_STATE.md`

Use `PROJECT_STATE.md` for concise current state:

- Current objective.
- Active plan.
- Recent decisions.
- Open questions.
- Known risks.
- Verification status.
- Next recommended action.

Update it before handoff when substantial work changes the repository, research direction, or verification status.

## `quality_reports/`

Use `quality_reports/` for detailed records:

- `specs/`: requirements specifications.
- `plans/`: approved execution plans.
- `session_logs/`: substantial session logs.
- `reviews/`: review reports.
- `scores/`: quality score reports.
- `checkpoints/`: intermediate handoffs.

## Naming Convention

Use date-first names with concise slugs:

```text
YYYY-MM-DD-short-description.md
```

Examples:

```text
2026-05-20-initial-scaffold-plan.md
2026-05-20-verification-checkpoint.md
2026-05-20-quality-score.md
```

## What To Record

Record enough detail for another agent or researcher to resume work:

- What was requested.
- What plan was used.
- What changed.
- What commands or checks were run.
- What evidence was collected.
- What quality score or threshold decision applied, when relevant.
- What remains unresolved.

## Score Reports

Score reports should record enough evidence for a future agent or human to understand the threshold decision:

- checked files
- regenerated outputs and freshness status
- verification evidence
- review evidence
- blockers and caps
- remaining risks
- final score and threshold interpretation
- override decision, if any

Do not use score reports as a substitute for reproducible code, logs, outputs, or independent review evidence.

Do not use logs as a substitute for clear code, reproducible scripts, or well-named outputs.
