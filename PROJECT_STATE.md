# Project State

Checked-in current state for Codex agents and human collaborators. Keep this file concise; put detailed history, logs, reviews, plans, checkpoints, and score reports under `quality_reports/`.

## Current Purpose

Maintain a Codex-native academic research workflow scaffold for plan-first, evidence-based, reviewable research work.

The scaffold is designed to be copied into empirical or quantitative research projects and then specialized with project-specific data, model, software, and collaboration conventions.

## Current Scaffold Status

- Main constitution: `AGENTS.md`.
- Workflow protocols: `workflow/`.
- Reusable templates: `templates/`.
- Durable reports: `quality_reports/`.
- Repo-scoped skills: `.agents/skills/`.
- Read-only project subagents: `.codex/agents/`.
- Detailed hardening history: `quality_reports/session_logs/scaffold-hardening-log.md`.

No active implementation plan is currently recorded.

## Active Workflow Loop

Full workflow mode:

```text
PRE-EXPLORE -> PLAN -> IMPLEMENT -> VERIFY -> REVIEW -> FIX -> RE-VERIFY -> SCORE -> SUMMARIZE
```

For ordinary nontrivial work, the core loop in `AGENTS.md` is:

```text
PLAN -> IMPLEMENT -> VERIFY -> REVIEW -> FIX -> RE-VERIFY -> SCORE -> SUMMARIZE
```

Lightweight inspection or planning may skip implementation, review, and scoring when the user asks only for exploration, planning, or summary.

## Available Skills

- `research-project-onboarding`: onboard or Codex-enable existing academic research projects.
- `stata-data-prep-exploration`: inspect raw or partially processed Stata data, sample construction, keys, merges, missingness, and cleaning needs.
- `empirical-analysis-planner`: map research questions to empirical strategy, variables, samples, specifications, tables, figures, and robustness checks.
- `stata-data-analysis`: produce Stata do-files, data construction, regressions, tables, figures, logs, and output documentation.
- `review-stata`: Stata review rubric for empirical pipelines, outputs, and reproducibility.
- `matlab-model-implementation`: implement or revise MATLAB quantitative economic model code.
- `review-matlab-model`: read-only MATLAB model review rubric.
- `matlab-quantitative-modeling`: temporary compatibility pointer to MATLAB producer/reviewer skills.

## Available Subagents

- `research_explorer`: read-only context mapping and repository inspection.
- `verifier`: read-only evidence, output, command, and reproducibility checks.
- `critical_reviewer`: read-only adversarial review of plans, code, outputs, reasoning, and handoff quality.
- `stata_reviewer`: read-only independent Stata review using the `review-stata` rubric.

Subagents should only be claimed when actually used.

## Current Quality Gates

- Plan-first work for nontrivial or ambiguous tasks.
- Data governance before working with data, logs, credentials, sensitive materials, or durable reports.
- Verification before completion claims.
- Independent review for substantial work when requested or runtime-authorized.
- Quality scoring for full workflow mode and substantial research-code or research-output tasks.
- Score thresholds from `workflow/QUALITY_SCORE_PROTOCOL.md`:
  - `<70`: do not present as complete.
  - `70-79`: partial; needs user review.
  - `80-89`: usable internal research output.
  - `90-94`: strong research draft output.
  - `95+`: polished, low-risk output.
- Score does not replace verification or review; direct manual actions can bypass the score system.

## Open Issues / Next Actions

- Test the full empirical workflow on a small real or toy Stata task.
- Test the full MATLAB workflow on a small model-code change or dry-run review.
- Decide later whether `matlab-quantitative-modeling` should remain as a compatibility pointer or be removed.
- Do not add hooks or new agents until the manual Codex-native workflow has been exercised.

## Last Verified State

2026-05-20 structural cleanup:

- `AGENTS.md`, `README.md`, workflow protocols, skills, score templates, and project state were aligned around the full workflow including SCORE.
- `workflow/QUALITY_SCORE_PROTOCOL.md` was adapted from the upstream Claude quality-gate model into Codex-native Stata/MATLAB research workflow language.
- `templates/quality-score-report.md`, `templates/stata-quality-score-report.md`, and `templates/matlab-quality-score-report.md` exist.
- `stata-data-analysis` is producer-oriented; independent review belongs to `review-stata`, `stata_reviewer`, `review-matlab-model`, `critical_reviewer`, and `verifier` as appropriate.
- Historical scaffold-hardening details were moved to `quality_reports/session_logs/scaffold-hardening-log.md`.
- Current cleanup score report: `quality_reports/scores/2026-05-20-claude-quality-score-sync.md` with score `93`.
