# Quality Score Protocol

Use this protocol after verification and review for substantial research-code or research-output tasks.

Quality scores are governance signals. They do not prove correctness, and they do not replace evidence, review findings, or user judgment.

## When To Score

Score substantial tasks that produce or modify:

- empirical code, datawork, tables, figures, or derived datasets
- quantitative model code, calibration, simulation, estimation, moments, tables, or figures
- durable project workflow artifacts
- written claims tied to research evidence

For narrow edits, a concise pass/fail verification summary is enough.

## Score Dimensions

Use a 0-100 score with concise evidence for each dimension:

- Correctness: logic, implementation behavior, numerical sanity, and consistency with the approved plan.
- Reproducibility: commands, environment, inputs, seeds, logs, and output paths are recorded well enough to rerun.
- Research integrity: empirical specifications, samples, variables, weights, fixed effects, clustering, model timing, constraints, calibration targets, and moments are explicit and not silently changed.
- Output freshness: tables, figures, derived datasets, and reported results are rebuilt or otherwise tied to current code and inputs.
- Code and artifact quality: code is readable, scoped, maintainable, and avoids unnecessary churn.
- Handoff quality: final state, unresolved questions, residual risks, and next actions are clear.

## Thresholds

Default thresholds:

- `95-100`: excellent; suitable for high-confidence handoff when evidence supports the score.
- `90-94`: strong; suitable for shareable research workflow outputs.
- `80-89`: acceptable local completion with documented residual risk.
- `<80`: do not present as complete unless the user explicitly accepts the residual risk.

When a task is high-stakes for a paper result, grant application, replication package, or public release, use `90` as the minimum completion threshold unless the user approves a lower threshold.

## Score Caps And Blocking Rules

Do not let a numeric score average away a serious failure.

Apply these caps before reporting the final score:

- Any unresolved `Blocker` review finding caps the score at `79` and prevents a completion claim unless the user explicitly accepts the residual risk.
- Any failed required verification step caps the score at `79` until the failure is fixed, rerun, or explicitly accepted as residual risk.
- Missing execution evidence for an executable task caps reproducibility at `60` and the overall score at `79`, unless the task was explicitly documentation-only or execution was unavailable and clearly marked.
- Missing freshness evidence for tables, figures, derived datasets, or reported results caps output freshness at `60`; if the task depends on those outputs being current, cap the overall score at `79`.
- Silent or unresolved changes to samples, empirical specifications, variable definitions, weights, fixed effects, clustering, model timing, constraints, calibration targets, or moment definitions cap research integrity at `60` and the overall score at `79`.
- Any unresolved `Major` review finding caps the score at `89` unless the finding is explicitly accepted as residual risk.

When a cap applies, report both the uncapped reasoning and the capped final score.

## Review Loop Limits

Default loop:

```text
IMPLEMENT -> VERIFY -> REVIEW -> FIX -> RE-VERIFY -> SCORE
```

If the score is below threshold, run at most three fix/review loops for ordinary tasks. Use up to five loops only when the user explicitly classifies the work as high-stakes and the remaining issues are actionable.

When the loop limit is reached, stop editing and report:

- current score
- blocking findings
- evidence collected
- what remains uncertain
- the decision needed from the user

Do not keep editing indefinitely to chase a score.

## Score Reports

Save substantial score reports under `quality_reports/scores/` using `templates/quality-score-report.md` and date-first names:

```text
YYYY-MM-DD-short-description.md
```

Each report should include:

- task and plan path
- final score and threshold
- any caps applied
- score by dimension
- verification evidence
- review findings resolved or accepted
- residual risks
- whether completion was claimed

## Override Rule

The user may accept a below-threshold result. Record the override, reason, date, and residual risks in the score report or session log, and do not describe the task as fully verified.
