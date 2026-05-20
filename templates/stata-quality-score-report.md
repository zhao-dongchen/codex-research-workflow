# Stata Quality Score Report

## Task Summary

State the empirical task, data inputs, analysis goal, and whether full workflow mode was requested.

## Files Modified

| File | Change Type | Notes |
|------|-------------|-------|
| `path/to/file.do` | added/modified/deleted | |

## Files Inspected

| File | Why It Was Inspected |
|------|----------------------|
| `path/to/file` | data/code/log/output/context |

## Outputs Generated Or Regenerated

| Output | Freshness Evidence | Status |
|--------|--------------------|--------|
| `path/to/table` | command/log/timestamp/hash | fresh/not freshness-verified/not applicable |

## Verification Evidence

- Stata command or do-file entrypoint:
- Stata version, if available:
- Logs inspected:
- Sample-count checks:
- Merge diagnostics:
- Output freshness checks:
- What could not be verified:

## Review Evidence

- Independent reviewer/subagent used:
- `review-stata` rubric used: yes/no
- Findings resolved:
- Findings accepted as residual risk:
- Review not performed because:

## 100-Point Rubric

| Dimension | Points Available | Points Awarded | Evidence |
|-----------|------------------|----------------|----------|
| Data orientation and provenance | 15 | | |
| Variable definitions, missingness, and units | 15 | | |
| Sample construction and merge logic | 20 | | |
| Empirical specification and identification alignment | 15 | | |
| Code reproducibility and output freshness | 20 | | |
| Interpretation, caveats, and handoff clarity | 15 | | |
| Total | 100 | | |

## Deductions And Caps

Apply all relevant caps before finalizing the score:

- Stata code does not run when execution is required: cap at `50` or lower.
- Outputs not regenerated in the current run when freshness is required: cap at `70`.
- Sample construction not checked: cap at `75`.
- Merge logic not diagnosed when merges are central: cap at `75`.
- Key variable definitions unsupported: cap at `70`.
- Fabricated or unsupported numerical claim: cap at `60` or lower.
- Hardcoded private absolute paths without fallback: deduct or cap if reproducibility is blocked.
- Missing log or output evidence: cap at `80`.
- Full workflow requested but no independent review: cap at `85`.
- Full workflow requested but no verification: cap at `70`.
- Unresolved blocker: cap at `69`.

| Issue | Deduction Or Cap | Evidence | Status |
|-------|------------------|----------|--------|
| | | | |

## Final Score

- Score:
- Threshold interpretation:
- Caps applied:
- Completion claimed: yes/no

Threshold interpretation:

- `<70`: do not present as complete.
- `70-79`: partial; needs user review.
- `80-89`: usable internal research output.
- `90-94`: strong research draft output.
- `95+`: polished, low-risk output.

## Remaining Risks

- List unresolved risks and why they remain.

## Final Decision

State whether the output is accepted, below threshold, blocked, or accepted only by explicit user override.

Scoring must cite evidence from actual files, logs, outputs, commands, or review notes. Do not score from agent confidence alone. If evidence is missing, lower the score, apply a cap, or state that scoring cannot be completed. The score does not override unresolved blockers.
