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
- Future MATLAB model-coding support should be added later as a skill.
- Generic project-scoped agents are read-only by default.
- The initial scaffold was created and verified on 2026-05-20.
- A follow-up audit on 2026-05-20 restored the required constitution filename from `AGENTS.txt` to `AGENTS.md`.
- A scaffold-hardening pass on 2026-05-20 added `workflow/DATA_GOVERNANCE.md`, strengthened reproducibility and output-freshness requirements, strengthened plan approval governance, and added `.gitignore` while removing `.DS_Store`, `.codex/.DS_Store`, and `.Rhistory` from Git tracking.
- An Existing Project Onboarding layer was added on 2026-05-20 to guide inspection, inference, and approved creation or reconciliation of project-specific orientation artifacts for pre-existing research repositories.
- A focused non-public workflow upgrade on 2026-05-20 clarified the two existing-project onboarding scenarios in `README.md`, corrected the `AGENTS.md` onboarding-report inventory, added the first real workflow skill (`research-project-onboarding`), clarified that the skill is conceptually cross-project and may later be installed at user scope, and updated onboarding prompts to operationalize the skill and request subagent support when available.
- A Stata empirical data-analysis skill (`stata-data-analysis`) was added on 2026-05-20 as the first substantive empirical-analysis skill, covering data reconnaissance, missingness and unit diagnosis, sample construction, exploratory and goal-directed analysis, merge discipline, readable Stata code, outputs, and Stata pipeline review.

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

## Next Recommended Action

Copy this scaffold into a future research project or begin adding project-specific research conventions, specs, plans, and skills as needed.
