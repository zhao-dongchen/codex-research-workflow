# Stata Producer/Reviewer Skill Split

## Status

Completed.

## Date Created

2026-05-20.

## Objective

Refactor the Stata skill architecture into a Pedro-style producer/reviewer split while preserving the empirical standards already captured in `stata-data-analysis`.

## Scope

- Refactor `.agents/skills/stata-data-analysis/SKILL.md` into the Stata producer skill.
- Add `.agents/skills/review-stata/SKILL.md` as a read-only reviewer skill.
- Update `README.md`, `.agents/skills/README.md`, and `PROJECT_STATE.md`.
- Make `stata-data-analysis` explicitly call or recommend `review-stata` before finalizing substantial outputs.
- Save this approved implementation plan under `quality_reports/plans/` before editing.

## Non-Scope

- No `stata_reviewer` agent.
- No MATLAB skill changes.
- No shared reference files.
- No scripts, hooks, automation, assets, LICENSE, CHANGELOG, or unrelated workflow changes.

## Implementation Steps

1. Save the approved plan to `quality_reports/plans/2026-05-20-stata-producer-reviewer-split.md`.
2. Refactor `stata-data-analysis`:
   - Update front matter description to emphasize Stata empirical artifact production.
   - Reframe body around deliverables: data-access status, pre-flight report, Data Orientation, sample-flow notes, do-files, logs, stats, tables, figures, regressions, final summary, verification/review notes.
   - Keep external-data rules, observation units, missingness, units/scales, sample construction, merge diagnosis, readable Stata code, output freshness, and tables/figures standards.
   - Remove code review / pipeline audit as a main operating mode.
   - Add a clear pointer that review/audit requests should use `review-stata`.
   - Require or recommend a `review-stata` pass before finalizing substantial outputs.
3. Add `review-stata`:
   - Instruction-only skill with only `name` and `description` front matter.
   - Define read-only default behavior.
   - Define Stata Review Report structure with severity-ranked findings.
   - Include review scope, merge discipline, regression/table review discipline, boundaries, and optional agent guidance.
4. Update docs:
   - `README.md`: list `stata-data-analysis` as producer and `review-stata` as read-only reviewer.
   - `.agents/skills/README.md`: same split, with canonical reusable skill positioning.
   - Update v0.1 note: Stata now has the first producer/reviewer split; MATLAB remains broad v0.1 and may later split into `matlab-model-implementation` and `review-matlab-model`.
5. Update `PROJECT_STATE.md` after verification to record the Stage 1 Stata architecture refactor.

## Verification Steps

- Confirm `.agents/skills/stata-data-analysis/SKILL.md` exists and is producer-oriented.
- Confirm `.agents/skills/review-stata/SKILL.md` exists and is read-only reviewer-oriented.
- Confirm both skill front matters contain only `name` and `description`.
- Confirm `review-stata` directory contains only `SKILL.md`.
- Confirm no scripts, hooks, automation, assets, or reference files were added.
- Confirm no MATLAB skill files changed.
- Confirm README and skills README accurately list the Stata producer/reviewer split.
- Confirm `PROJECT_STATE.md` records the Stage 1 refactor only after verification.
- Confirm `git status --short` shows only intended files.

## Review Steps

- Run a focused read-through against the approved scope.
- Do not spawn subagents unless explicitly requested; this pass will use local verification and review.

## Risks And Assumptions

- Risk: over-shrinking `stata-data-analysis` could lose useful empirical guardrails. Mitigation: preserve standards but make them serve artifact production.
- Risk: duplicating too much text between producer and reviewer skills. Mitigation: keep overlap only where each skill must stand alone without shared references.
- Assumption: no separate requirements spec is needed because the user supplied detailed acceptance criteria.

## Acceptance Criteria

- Stata has a clear producer skill and a clear reviewer skill.
- Review requests no longer route naturally into the producer skill.
- `stata-data-analysis` explicitly recommends `review-stata` before finalizing substantial outputs.
- The repository documents the split accurately.
- No unrelated architecture, MATLAB, automation, or public-facing files are changed.

## Approval

Approved by the user on 2026-05-20 with one instruction: make `stata-data-analysis` explicitly call or recommend `review-stata` before finalizing substantial outputs.

## Completion Notes

Implemented and verified on 2026-05-20. `stata-data-analysis` is now producer-oriented, `review-stata` was added as the read-only reviewer skill, README and skills README list the split, and `PROJECT_STATE.md` records the milestone. Verification found no MATLAB skill changes and no added scripts, hooks, automation, assets, references, LICENSE, or CHANGELOG files.

A final combined pre-commit audit was run after the Stata and MATLAB producer/reviewer refactor implementation. The audit found no substantive skill-architecture blockers. It identified one bookkeeping issue: this plan and `PROJECT_STATE.md` had already marked the work completed or verified before the final audit was recorded. That issue is resolved by this records-only update before commit.
