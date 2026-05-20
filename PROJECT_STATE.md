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
- No substantive domain-specific skills are included yet.
- Future Stata empirical-analysis and MATLAB model-coding support should be added later as skills.
- Generic project-scoped agents are read-only by default.
- The initial scaffold was created and verified on 2026-05-20.
- A follow-up audit on 2026-05-20 restored the required constitution filename from `AGENTS.txt` to `AGENTS.md`.
- A scaffold-hardening pass on 2026-05-20 added `workflow/DATA_GOVERNANCE.md`, strengthened reproducibility and output-freshness requirements, strengthened plan approval governance, and added `.gitignore` while removing `.DS_Store`, `.codex/.DS_Store`, and `.Rhistory` from Git tracking.
- An Existing Project Onboarding layer was added on 2026-05-20 to guide inspection, inference, and approved creation or reconciliation of project-specific orientation artifacts for pre-existing research repositories.

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

## Next Recommended Action

Copy this scaffold into a future research project or begin adding project-specific research conventions, specs, plans, and skills as needed.
