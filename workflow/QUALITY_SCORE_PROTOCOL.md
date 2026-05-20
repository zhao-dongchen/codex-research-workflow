# Quality Score Protocol

Use this protocol as the Codex-native quality checkpoint for substantial research-code or research-output tasks.

This protocol adapts the upstream Claude workflow quality-gate model to this scaffold: a 0-100 score, threshold interpretation at 80/90/95, deduction-based scoring where useful, hard caps for serious failures, and explicit evidence requirements. The score is a workflow checkpoint, not a guarantee of correctness.

## Role Of The Score

- Score is advisory unless a workflow, skill, automation, or user instruction explicitly enforces it.
- Score does not replace verification.
- Score does not replace independent review.
- Review does not replace execution evidence.
- Direct manual actions can bypass the score system. If the full workflow is bypassed, the score system is bypassed too.
- A score cannot be self-awarded from confidence alone. It must cite evidence from actual files, logs, outputs, commands, or review notes.

## When To Score

Full workflow mode requires:

```text
PLAN -> IMPLEMENT -> VERIFY -> REVIEW -> FIX -> RE-VERIFY -> SCORE -> SUMMARIZE
```

Score substantial tasks that produce or modify:

- empirical code, datawork, tables, figures, or derived datasets
- quantitative model code, calibration, simulation, estimation, moments, tables, or figures
- durable project workflow artifacts
- written claims tied to research evidence

For narrow inspection, planning, or summarization tasks, a pass/fail verification summary is enough unless the user requests the full workflow.

## Thresholds

Use a 0-100 score:

- `<70`: do not present as complete.
- `70-79`: partial; needs user review before relying on it.
- `80-89`: usable internal research output; minimum acceptable completion threshold.
- `90-94`: strong research draft output; PR-like threshold.
- `95+`: polished, low-risk output; excellence threshold and aspirational target.

For high-stakes paper results, replication packages, grant materials, or public releases, use `90` as the minimum threshold unless the user explicitly accepts a lower threshold.

## Evidence Required

Quality reports must record:

- checked files
- inspected inputs and documentation
- modified files
- commands run
- logs inspected
- outputs generated or regenerated
- output freshness evidence
- independent review evidence, when full workflow mode was requested
- verification evidence
- blockers
- remaining risks

If evidence is missing, lower the score, apply a cap, or state that scoring cannot be completed.

## Deduction-Based Scoring

Start from 100 when the task is fully implemented, verified, reviewed, and documented. Deduct for observed issues:

- Critical execution failure: `-50` to `-100`, or auto-fail if the artifact cannot be used.
- Unsupported or fabricated evidence: `-40` to `-100`.
- Missing verification for a required executable step: `-30` to `-50`.
- Stale or unregenerated required outputs: `-20` to `-40`.
- Missing independent review in full workflow mode: `-10` to `-20`.
- Missing reproducibility metadata: `-5` to `-20`.
- Unclear handoff, paths, or output manifest: `-5` to `-15`.
- Minor style, readability, or documentation problems: `-1` to `-5`.

Use task-specific templates for Stata and MATLAB when applicable.

## Score Caps And Blocking Rules

Apply caps before reporting the final score. A cap overrides any additive or averaged score.

- Unresolved `Blocker` review finding: cap at `69`; no completion claim unless the user explicitly accepts residual risk.
- Required code does not run when execution is required: cap at `50` or lower.
- Failed required verification step: cap at `69` until fixed, rerun, or explicitly accepted as residual risk.
- Missing execution evidence for an executable task: cap at `79`; cap reproducibility at `60`.
- Missing output freshness evidence for required tables, figures, simulations, derived datasets, or reported results: cap at `70`; cap output freshness at `60`.
- Full workflow requested but no independent review: cap at `85`.
- Full workflow requested but no verification: cap at `70`.
- Silent or unresolved changes to samples, empirical specifications, variable definitions, weights, fixed effects, clustering, model timing, constraints, calibration targets, or moment definitions: cap at `79`; cap research integrity at `60`.
- Fabricated or unsupported numerical claim: cap at `60` or lower.
- Hardcoded private absolute paths without fallback: deduct or cap based on whether reproducibility is blocked.
- Unresolved `Major` review finding: cap at `89` unless accepted as residual risk.

When a cap applies, report both the uncapped reasoning and the capped final score.

## Review Loop Limits

Default full workflow loop:

```text
IMPLEMENT -> VERIFY -> REVIEW -> FIX -> RE-VERIFY -> SCORE
```

If the score is below threshold, run at most three fix/review loops for ordinary tasks. Use up to five loops only when the user explicitly classifies the work as high-stakes and the remaining issues are actionable.

When the loop limit is reached, stop editing and report:

- current score
- caps or blockers
- evidence collected
- what remains uncertain
- the decision needed from the user

Do not keep editing indefinitely to chase a score.

## Score Reports

Save substantial score reports under `quality_reports/scores/` using `templates/quality-score-report.md` and date-first names:

```text
YYYY-MM-DD-short-description.md
```

Use `templates/stata-quality-score-report.md` for Stata empirical work and `templates/matlab-quality-score-report.md` for MATLAB quantitative model work.

## Override Rule

The user may accept a below-threshold result. Record the override, reason, date, and residual risks in the score report or session log, and do not describe the task as fully verified.
