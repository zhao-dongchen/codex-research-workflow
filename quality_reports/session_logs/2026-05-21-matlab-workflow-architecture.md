# MATLAB Workflow Architecture Update

## Task

Reorganize the MATLAB quantitative-modeling workflow so the scaffold supports coherent whole-model construction, adaptive validation of high-risk components, integration and sanity checks, speed/memory discipline, and independent reviewer subagents.

## Changes

- Added `matlab-model-planner` for design, diagnosis, model-object mapping, numerical challenge mapping, high-risk test planning, and implementation order.
- Added `matlab-model-builder` as the main whole-model producer skill.
- Added builder references for high-risk component tests and vectorization/memory standards.
- Converted `matlab-model-implementation` into a legacy compatibility pointer.
- Converted `matlab-quantitative-modeling` into a broad compatibility pointer.
- Removed the active `review-matlab-model` skill after preserving review criteria in `.codex/agents/references/matlab-review-protocol.md`.
- Added `matlab_reviewer` as the independent read-only MATLAB quantitative model reviewer subagent.
- Chose not to add `quant_model_reviewer`; economic model logic is covered by `matlab_reviewer`, with `critical_reviewer` available for broader adversarial research-claim review.
- Updated README, skills README, `PROJECT_STATE.md`, and `templates/matlab-quality-score-report.md`.

## Validation

- Skill front matter check passed for every remaining `.agents/skills/*/SKILL.md`.
- `.codex/config.toml` and `.codex/agents/*.toml` parsed with Python `tomllib`.
- `git diff --check` passed.
- Stale-reference search found `review-matlab-model` only in historical `quality_reports/` records.

## Residual Risk

The MATLAB workflow architecture has not yet been smoke-tested on a real or toy MATLAB model task.
