# Project State

This file is checked-in project memory for Codex agents and human collaborators. Keep it concise and current. Put detailed evidence, logs, reviews, plans, and checkpoints in `quality_reports/`.

## Current Objective

Maintain a Codex-native academic research workflow scaffold.

## Active Plan

- Path: none.
- Status: none.
- Approval: none.

## Recent Decisions

- The scaffold uses Codex-native files and conventions rather than Claude-specific files.
- The initial scaffold is infrastructure only.
- `stata-data-analysis` is the first substantive empirical-analysis skill included in the scaffold.
- `matlab-quantitative-modeling` is the first substantive quantitative-modeling skill included in the scaffold.
- Generic project-scoped agents are read-only by default.
- The initial scaffold was created and verified on 2026-05-20.
- A follow-up audit on 2026-05-20 restored the required constitution filename from `AGENTS.txt` to `AGENTS.md`.
- A scaffold-hardening pass on 2026-05-20 added `workflow/DATA_GOVERNANCE.md`, strengthened reproducibility and output-freshness requirements, strengthened plan approval governance, and added `.gitignore` while removing `.DS_Store`, `.codex/.DS_Store`, and `.Rhistory` from Git tracking.
- An Existing Project Onboarding layer was added on 2026-05-20 to guide inspection, inference, and approved creation or reconciliation of project-specific orientation artifacts for pre-existing research repositories.
- A focused non-public workflow upgrade on 2026-05-20 clarified the two existing-project onboarding scenarios in `README.md`, corrected the `AGENTS.md` onboarding-report inventory, added the first real workflow skill (`research-project-onboarding`), clarified that the skill is conceptually cross-project and may later be installed at user scope, and updated onboarding prompts to operationalize the skill and request subagent support when available.
- A Stata empirical data-analysis skill (`stata-data-analysis`) was added on 2026-05-20 as the first substantive empirical-analysis skill, covering data reconnaissance, missingness and unit diagnosis, sample construction, exploratory and goal-directed analysis, merge discipline, readable Stata code, outputs, and Stata pipeline review.
- A MATLAB quantitative-modeling skill (`matlab-quantitative-modeling`) was added on 2026-05-20 as the first substantive quantitative-modeling skill, covering model-code reconnaissance, numerical implementation, distribution/simulation/moments, calibration/estimation/optimization, nonstandard numerical structures, generated-code caution, readable MATLAB code, efficiency, and MATLAB model-code review.
- A Stage 1 Pedro-style Stata skill refactor on 2026-05-20 made `stata-data-analysis` the Stata producer skill and initially added `review-stata` as a read-only reviewer skill; the later Stata review architecture refinement supersedes that actor/rubric split.
- A Stage 2 Pedro-style MATLAB skill refactor on 2026-05-20 added `matlab-model-implementation` as the MATLAB producer/modifier skill, added `review-matlab-model` as the read-only MATLAB model reviewer skill, and converted `matlab-quantitative-modeling` into a temporary compatibility pointer.
- A Stata review architecture refinement on 2026-05-20 made `review-stata` the reusable review rubric and added `.codex/agents/stata_reviewer.toml` as the independent read-only Stata reviewer actor. The scaffold now treats skills as workflow-step instructions and subagents as independent evaluators or parallel inspectors.
- A quality-score protocol was added on 2026-05-20 to support bounded auto-flow loops for substantial research-code and research-output work.

## Open Questions

- None currently recorded.

## Known Risks

- Project-level Codex agent conventions may evolve, so custom agent files should remain simple and easy to adjust.
- Future research projects copied from this scaffold must add their own project-specific data, model, replication, and software conventions.

## Verification Status

Initial scaffold verification passed on 2026-05-20:

- Requested scaffold files and directories exist.
- No Claude-specific files or directories were created.
- `.codex/config.toml` contains only the requested `[agents]` settings.
- Custom agent TOML files parse and include `sandbox_mode = "read-only"`.
- `.agents/skills/` contains only placeholder documentation.
- Follow-up audit confirmed `AGENTS.md` exists and no `AGENTS.txt` remains.

Scaffold-hardening verification passed on 2026-05-20:

- `workflow/DATA_GOVERNANCE.md` exists and is linked from `AGENTS.md`.
- Reproducibility and output-freshness requirements are present in the verification protocol, quality gates, and templates.
- Plan approval governance is reflected in the plan protocol, execution-plan template, and active-plan state fields.
- `.gitignore` ignores `.DS_Store`, nested `.DS_Store`, and `.Rhistory`.
- `.DS_Store`, `.codex/.DS_Store`, and `.Rhistory` were removed from Git tracking while remaining ignored local files.

Existing Project Onboarding verification passed on 2026-05-20:

- `workflow/PROJECT_ONBOARDING_PROTOCOL.md`, `templates/project-profile.md`, `templates/project-onboarding-report.md`, and `quality_reports/onboarding/.gitkeep` exist.
- `AGENTS.md`, `README.md`, and `workflow/QUALITY_GATES.md` reference the onboarding workflow.
- The onboarding guidance requires inspection before edits, handles existing orientation artifacts, and distinguishes evidence-backed facts, inferences, assumptions, user-confirmed facts, and unresolved questions.
- No domain-specific skills, hooks, or automation were added.

Focused non-public workflow upgrade verification passed on 2026-05-20:

- `README.md` distinguishes Case A, where the scaffold is already present, from Case B, where an existing project does not yet contain the scaffold.
- Case A and Case B include practical copy-paste prompts; Case B includes `Scaffold source: [LOCAL PATH OR GITHUB URL]`, remains robust when `$research-project-onboarding` is unavailable, and says Codex should ask for a scaffold source before exact file-level integration planning.
- `README.md` prompts mention `$research-project-onboarding` where appropriate and request `research_explorer`, `critical_reviewer`, and `verifier` when available.
- `AGENTS.md` includes onboarding reports in the `quality_reports/` inventory.
- `.agents/skills/research-project-onboarding/SKILL.md` exists with valid `name` and `description` front matter, is instruction-only, covers both onboarding scenarios, and distinguishes evidence, inference, assumptions, user-confirmed facts, and unresolved questions.
- `.agents/skills/README.md` distinguishes repo-scoped skills from reusable user-level skills and positions `research-project-onboarding` as the canonical source implementation in this repo.
- No public-facing issue-4 items, domain-specific Stata or MATLAB skills, hooks, scripts, or automation were added.
- A final focused pre-commit audit using `critical_reviewer` and `verifier` found no substantive implementation blocker. It identified one bookkeeping/governance issue: the plan and this project state had already been marked completed or verified before the final audit was recorded. That issue was resolved by updating the workflow records before commit.

Stata empirical data-analysis skill verification passed on 2026-05-20:

- `.agents/skills/stata-data-analysis/SKILL.md` exists with valid `name` and `description` front matter.
- The skill directory contains only `SKILL.md`; no scripts, hooks, automation, assets, or reference files were added.
- The skill covers data reconnaissance, variable/unit/missingness diagnosis, sample construction, exploratory and goal-directed analysis, and Stata code review/pipeline audit.
- The skill includes external-data handling, merge diagnosis, missingness diagnosis, unit and scale checks, human-readable Stata code standards, table/figure/output standards, explicit boundaries, and optional subagent guidance.
- `README.md` and `.agents/skills/README.md` mention the new skill with minimal documentation changes.

MATLAB quantitative-modeling skill verification passed on 2026-05-20:

- `.agents/skills/matlab-quantitative-modeling/SKILL.md` exists with valid `name` and `description` front matter.
- The skill directory contains only `SKILL.md`; no scripts, hooks, automation, assets, or reference files were added.
- The skill covers model-code reconnaissance, numerical implementation and revision, distribution/simulation/moments, calibration/estimation/optimization, nonstandard numerical structure awareness, and MATLAB code review/readability/performance audit.
- The skill includes a dedicated efficiency and memory discipline section, human-readable quantitative code standards, generated-code/toolchain caution, explicit boundaries, and optional available-agent guidance.
- `README.md` and `.agents/skills/README.md` mention the new skill with minimal documentation changes.

Stata producer/reviewer split verification passed on 2026-05-20:

- The approved plan is saved at `quality_reports/plans/2026-05-20-stata-producer-reviewer-split.md`.
- `.agents/skills/stata-data-analysis/SKILL.md` exists and is now producer-oriented, points read-only review or audit requests to `review-stata`, and recommends review before finalizing substantial empirical outputs.
- `.agents/skills/review-stata/SKILL.md` exists as a Stata review rubric with a severity-ranked Stata Review Report deliverable.
- Both Stata skill files have front matter containing only `name` and `description`.
- `.agents/skills/review-stata/` contains only `SKILL.md`; no scripts, hooks, automation, assets, or reference files were added.
- `README.md` and `.agents/skills/README.md` list `stata-data-analysis` as the Stata producer skill and `review-stata` as the Stata review rubric.
- `.agents/skills/matlab-quantitative-modeling/SKILL.md` was not changed.

MATLAB producer/reviewer split verification passed on 2026-05-20:

- The approved plan is saved at `quality_reports/plans/2026-05-20-matlab-producer-reviewer-split.md`.
- `.agents/skills/matlab-model-implementation/SKILL.md` exists as the MATLAB producer/modifier skill with deliverables for a `Model-Code Map`, change-impact analysis, implementation plan, approved file changes, verification summary, and unresolved risks.
- `.agents/skills/review-matlab-model/SKILL.md` exists as the read-only MATLAB model reviewer skill with a severity-ranked `MATLAB Model Review Report` deliverable.
- `.agents/skills/matlab-quantitative-modeling/SKILL.md` is now a short temporary compatibility pointer that directs users to `matlab-model-implementation` or `review-matlab-model` and does not claim automatic dispatch.
- The new MATLAB skill directories contain only `SKILL.md`; no scripts, hooks, automation, assets, or reference files were added.
- `README.md` and `.agents/skills/README.md` list the MATLAB producer/reviewer split and identify `matlab-quantitative-modeling` as a temporary compatibility pointer.
- Stata skill files were not changed during the Stage 2 MATLAB split.

Combined Stata/MATLAB skill-architecture pre-commit audit passed on 2026-05-20:

- A final combined audit was run after the Stata and MATLAB producer/reviewer refactor implementation using `critical_reviewer` and `verifier`.
- The audit found no substantive skill-architecture blockers.
- The audit identified one bookkeeping issue: the Stata and MATLAB plan files and this project state had already marked the work completed or verified before the final audit was recorded.
- That issue was resolved by records-only updates to the two plan files and this project state before commit.

Stata reviewer subagent and scoring structure verification passed on 2026-05-20:

- The approved plan is saved at `quality_reports/plans/2026-05-20-stata-reviewer-subagent-and-scoring.md`.
- `.codex/agents/stata_reviewer.toml` exists as a read-only Stata reviewer actor.
- `.agents/skills/review-stata/SKILL.md` exists as the Stata review rubric and directs independent review to `stata_reviewer` when authorized and available.
- `.agents/skills/stata-data-analysis/SKILL.md` exists as the Stata producer skill.
- `workflow/QUALITY_SCORE_PROTOCOL.md` and `quality_reports/scores/.gitkeep` exist, and score reports are linked from the main workflow documentation.
- `templates/quality-score-report.md` exists as the reusable score-report template.
- The tracked duplicate `.agents/skills/empirical-analysis-planner copy/SKILL.md` was removed.
- Follow-up audit fixes added blocker/cap rules to `workflow/QUALITY_SCORE_PROTOCOL.md`, tightened subagent authorization wording, clarified that rubric-only Stata review is non-independent self-review, and added `quality_reports/scores/2026-05-20-stata-reviewer-subagent-and-scoring.md` with a score of 91 against a threshold of 90.

## Next Recommended Action

Copy this scaffold into a future research project or begin adding project-specific research conventions, specs, plans, and skills as needed.
