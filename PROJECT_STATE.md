# Project State

This file is checked-in project memory for Codex agents and human collaborators. Keep it concise and current. Put detailed evidence, logs, reviews, plans, and checkpoints in `quality_reports/`.

## Current Objective

Maintain a Codex-native academic research workflow scaffold.

## Active Plan

No active implementation plan is currently in progress.

## Recent Decisions

- The scaffold uses Codex-native files and conventions rather than Claude-specific files.
- The initial scaffold is infrastructure only.
- No substantive domain-specific skills are included yet.
- Future Stata empirical-analysis and MATLAB model-coding support should be added later as skills.
- Generic project-scoped agents are read-only by default.
- The initial scaffold was created and verified on 2026-05-20.
- A follow-up audit on 2026-05-20 restored the required constitution filename from `AGENTS.txt` to `AGENTS.md`.

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

## Next Recommended Action

Copy this scaffold into a future research project or begin adding project-specific research conventions, specs, plans, and skills as needed.
