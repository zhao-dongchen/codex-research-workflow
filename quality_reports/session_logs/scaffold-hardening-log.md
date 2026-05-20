# Scaffold Hardening Log

This log preserves historical context that was removed from `PROJECT_STATE.md` to keep the checked-in state file concise.

## 2026-05-20 Structural History

- The repository was initialized as a Codex-native academic research workflow scaffold.
- The scaffold intentionally uses Codex-native conventions rather than Claude-specific project files.
- `AGENTS.md` was restored as the required project constitution filename after an audit found an earlier `AGENTS.txt` mismatch.
- `workflow/DATA_GOVERNANCE.md` was added, and reproducibility, output freshness, plan approval, and quality-gate language were strengthened.
- Existing-project onboarding support was added through `workflow/PROJECT_ONBOARDING_PROTOCOL.md`, onboarding templates, and the `research-project-onboarding` skill.
- Stata workflow skills were added and then clarified into separate roles:
  - `stata-data-prep-exploration`: raw or partially processed data orientation, sample construction, missingness, keys, merges, and minimal cleaning plans.
  - `empirical-analysis-planner`: empirical strategy and output planning.
  - `stata-data-analysis`: producer skill for Stata do-files, data construction, regressions, tables, figures, logs, and output documentation.
  - `review-stata`: Stata review rubric.
- MATLAB workflow skills were added and split:
  - `matlab-model-implementation`: producer/modifier skill.
  - `review-matlab-model`: read-only model reviewer skill.
  - `matlab-quantitative-modeling`: temporary compatibility pointer.
- `stata_reviewer` was added as the independent read-only Stata reviewer actor.
- `workflow/QUALITY_SCORE_PROTOCOL.md`, `quality_reports/scores/`, and score-report templates were added.
- The duplicate tracked skill `.agents/skills/empirical-analysis-planner copy/SKILL.md` was removed.

## Verification Notes Preserved From Prior State

- Initial scaffold checks confirmed requested scaffold files and directories existed, no Claude-specific directories were created, `.codex/config.toml` contained the expected `[agents]` settings, and custom agent TOML files used read-only sandboxes.
- Scaffold-hardening checks confirmed `workflow/DATA_GOVERNANCE.md` was linked, reproducibility and output-freshness requirements existed in protocols and templates, plan approval governance was reflected in the plan protocol and template, and `.gitignore` ignored `.DS_Store` and `.Rhistory`.
- Existing-project onboarding checks confirmed onboarding protocol, templates, and report directories existed, and that onboarding guidance required inspection before edits and separated evidence-backed facts, inferences, assumptions, user-confirmed facts, and unresolved questions.
- Focused workflow-upgrade checks confirmed README onboarding cases, onboarding prompts, and `research-project-onboarding` were present.
- Stata and MATLAB skill split checks confirmed the intended skill files existed with front matter and no added scripts, hooks, automation, assets, references, LICENSE, or CHANGELOG files.
- Stata reviewer and scoring checks confirmed `stata_reviewer`, `review-stata`, `stata-data-analysis`, `workflow/QUALITY_SCORE_PROTOCOL.md`, `templates/quality-score-report.md`, and `quality_reports/scores/.gitkeep` existed.
- Follow-up audit fixes added blocker/cap rules, tightened subagent authorization wording, clarified that rubric-only Stata review is non-independent self-review, and added `quality_reports/scores/2026-05-20-stata-reviewer-subagent-and-scoring.md`.

## Historical Plan Artifacts

Detailed prior implementation plans remain under `quality_reports/plans/`, including:

- `2026-05-20-focused-non-public-workflow-upgrade.md`
- `2026-05-20-stata-data-analysis-skill.md`
- `2026-05-20-stata-producer-reviewer-split.md`
- `2026-05-20-matlab-quantitative-modeling-skill.md`
- `2026-05-20-matlab-producer-reviewer-split.md`
- `2026-05-20-stata-reviewer-subagent-and-scoring.md`
