# MATLAB Quality Score Report

## Task Summary

State the quantitative model task, model component, output target, and whether full workflow mode was requested.

## Files Modified

| File | Change Type | Notes |
|------|-------------|-------|
| `path/to/file.m` | added/modified/deleted | |

## Files Inspected

| File | Why It Was Inspected |
|------|----------------------|
| `path/to/file` | model/code/output/context |

## Outputs Generated Or Regenerated

| Output | Freshness Evidence | Status |
|--------|--------------------|--------|
| `path/to/output` | command/log/timestamp/hash | fresh/not freshness-verified/not applicable |

## Verification Evidence

- MATLAB command or entrypoint:
- MATLAB/toolbox versions, if available:
- Logs or console output inspected:
- Convergence checks:
- Simulation/distribution/moment checks:
- Output freshness checks:
- What could not be verified:

## Review Evidence

- Independent reviewer/subagent used:
- MATLAB review protocol reference used: yes/no (`.codex/agents/references/matlab-review-protocol.md`)
- Economic model review used: `matlab_reviewer` / `critical_reviewer` / not applicable / not performed
- Review independence: independent / non-independent / not performed
- Findings resolved:
- Findings accepted as residual risk:
- Review not performed because:

## 100-Point Rubric

| Dimension | Points Available | Points Awarded | Evidence |
|-----------|------------------|----------------|----------|
| Coherent whole-model construction and model-code mapping | 15 | | |
| Economic logic and consistency with equations | 15 | | |
| High-risk/result-critical component identification | 15 | | |
| Proportionate validation, targeted tests, and probes | 15 | | Evidence should match risk; record deferred checks when relevant. |
| Integration, sanity, convergence, simulation, distribution, and moment checks | 15 | | |
| Reproducibility, output freshness, and execution evidence | 10 | | |
| Performance, memory, readability, and handoff clarity | 10 | | |
| Independent MATLAB and economic-model review evidence | 5 | | |
| Total | 100 | | |

## Deductions And Caps

Apply all relevant caps before finalizing the score:

- MATLAB code does not run when execution is required: cap at `50` or lower.
- No execution evidence when execution was feasible and required: cap at `70` or lower.
- No targeted validation for nonstandard or high-risk/result-critical components that affect results: cap at `80` or lower.
- No integration or sanity check for a full-model change: cap at `80` or lower.
- Convergence not checked when central: cap at `75`.
- Model equations and code are inconsistent: cap at `70`.
- Stale simulation outputs used as evidence: cap at `70`.
- Policy functions, stationary distribution, or moments not checked when relevant: cap at `80`.
- Fabricated or unsupported numerical or economic claim: cap at `60` or lower.
- Performance claim without timing, profiling, or comparable evidence: deduct or cap based on materiality.
- Performance issues prevent the required run: cap based on partial evidence.
- Full workflow requested but no independent review: cap at `85`.
- Economic model change with no economic-logic review: cap at `85` unless the user explicitly requested code-only work.
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

Validation should be proportionate. Reward clear identification of high-risk/result-critical components, cheap probes or targeted checks where appropriate, explicit deferral of lower-value tests, verifier/reviewer assessment of sufficiency, and claims limited to the evidence. Do not require large test suites for low-risk construction work.
