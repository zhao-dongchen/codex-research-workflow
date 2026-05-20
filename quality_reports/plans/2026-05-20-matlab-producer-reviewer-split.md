# MATLAB Producer/Reviewer Skill Split

## Status

Completed.

## Date Created

2026-05-20.

## Objective

Split the broad `matlab-quantitative-modeling` v0.1 skill into clearer Pedro-style MATLAB producer and reviewer skills while preserving the quantitative economic modeling standards already captured in the broad skill.

## Scope

- Add `.agents/skills/matlab-model-implementation/SKILL.md` as the MATLAB quantitative-model producer/modifier skill.
- Add `.agents/skills/review-matlab-model/SKILL.md` as the read-only MATLAB model reviewer skill.
- Convert `.agents/skills/matlab-quantitative-modeling/SKILL.md` into a short transitional compatibility pointer.
- Update `README.md`, `.agents/skills/README.md`, and `PROJECT_STATE.md`.
- Save this approved implementation plan under `quality_reports/plans/` before editing.

## Non-Scope

- No `matlab_model_reviewer` agent.
- No Stata skill changes during this MATLAB split.
- No shared reference files.
- No scripts, hooks, automation, assets, LICENSE, CHANGELOG, or unrelated workflow changes.

## Implementation Steps

1. Save this approved plan to `quality_reports/plans/2026-05-20-matlab-producer-reviewer-split.md`.
2. Add `matlab-model-implementation`:
   - Instruction-only skill with only `name` and `description` front matter.
   - Define it as the producer/modifier skill for implementing or revising MATLAB quantitative model code and updating downstream routines.
   - Include expected deliverables: `Model-Code Map`, change-impact analysis, implementation plan, modified files after approval, verification summary, and unresolved risks.
   - Preserve standards for model-code reconnaissance, numerical implementation, distribution/simulation/moments, calibration/estimation/optimization, nonstandard numerical structures, readable MATLAB code, efficiency and memory discipline, generated-code/toolchain caution, and evidence discipline.
   - Recommend `review-matlab-model` before finalizing substantial model changes.
3. Add `review-matlab-model`:
   - Instruction-only skill with only `name` and `description` front matter.
   - Define it as a read-only reviewer skill for MATLAB quantitative model code.
   - Include the `MATLAB Model Review Report` deliverable.
   - Cover economic correctness, numerical correctness, downstream consistency, performance, memory, readability, generated-code/toolchain risks, and verification evidence.
   - Default to no edits unless the user requests fixes or approves a follow-up implementation plan.
4. Convert `matlab-quantitative-modeling` into a short transitional compatibility pointer:
   - State that `matlab-model-implementation` should be used for implementing or revising MATLAB quantitative model code.
   - State that `review-matlab-model` should be used for read-only audit or review.
   - State that this broad skill name is retained temporarily for compatibility and may be removed after real-use testing.
   - Do not describe it as an automatic router.
5. Update docs:
   - `README.md`: list `matlab-model-implementation` and `review-matlab-model`; note `matlab-quantitative-modeling` is a transitional compatibility pointer.
   - `.agents/skills/README.md`: same canonical skill positioning.
6. Update `PROJECT_STATE.md` after verification to record the Stage 2 MATLAB split.

## Verification Steps

- Confirm `.agents/skills/matlab-model-implementation/SKILL.md` exists and is producer/modifier oriented.
- Confirm `.agents/skills/review-matlab-model/SKILL.md` exists and is read-only reviewer oriented.
- Confirm `.agents/skills/matlab-quantitative-modeling/SKILL.md` is a short transitional compatibility pointer and does not claim automatic dispatch.
- Confirm all three MATLAB skill front matters contain only `name` and `description`.
- Confirm new MATLAB skill directories contain only `SKILL.md`.
- Confirm no scripts, hooks, automation, assets, or reference files were added.
- Confirm Stata skill files are not changed during this MATLAB split.
- Confirm README and skills README accurately list the Stata and MATLAB producer/reviewer architecture.
- Confirm `PROJECT_STATE.md` records the MATLAB split only after verification.
- Confirm `git status --short` shows only intended files, including the already pending Stage 1 Stata files.

## Review Steps

- Run a focused read-through against the approved scope.
- Do not spawn subagents unless explicitly requested; this pass will use local verification and review.

## Risks And Assumptions

- Risk: converting the broad MATLAB skill too aggressively could break old prompts. Mitigation: keep it as a short compatibility pointer during transition.
- Risk: duplicating too much content between producer and reviewer skills. Mitigation: keep overlap only where each skill must stand alone without shared references.
- Assumption: no separate requirements spec is needed because the user supplied detailed acceptance criteria.

## Acceptance Criteria

- MATLAB has a clear producer/modifier skill and a clear read-only reviewer skill.
- `matlab-quantitative-modeling` is retained only as a compatibility pointer, not a full router.
- Stata skill files are not changed during the MATLAB split.
- The repository documents the split accurately.
- No unrelated architecture, automation, or public-facing files are changed.

## Approval

Approved by the user on 2026-05-20 with the refinement that `matlab-quantitative-modeling` should be a transitional compatibility pointer, not a claimed automatic router.

## Completion Notes

Implemented and verified on 2026-05-20. `matlab-model-implementation` and `review-matlab-model` were added as instruction-only skills, `matlab-quantitative-modeling` was converted into a short compatibility pointer, README and skills README list the split, and `PROJECT_STATE.md` records the milestone. Verification found no added scripts, hooks, automation, assets, references, LICENSE, or CHANGELOG files.

A final combined pre-commit audit was run after the Stata and MATLAB producer/reviewer refactor implementation. The audit found no substantive skill-architecture blockers. It identified one bookkeeping issue: this plan and `PROJECT_STATE.md` had already marked the work completed or verified before the final audit was recorded. That issue is resolved by this records-only update before commit.
