# Add `stata-data-analysis` Skill

## Status

Completed.

## Date Created

2026-05-20.

## Objective

Add the first substantive empirical-analysis skill to this workflow repository: an instruction-only, reusable `stata-data-analysis` skill for research-grade Stata empirical workflows.

## Scope

- Add `.agents/skills/stata-data-analysis/SKILL.md`.
- Minimally update `README.md` and `.agents/skills/README.md` to mention the new canonical reusable Stata empirical-analysis skill.
- Update `PROJECT_STATE.md` after implementation and verification.
- Save this approved plan under `quality_reports/plans/`.

## Non-Scope

- No helper scripts, hooks, automation, assets, or reference files.
- No separate Stata reviewer agent.
- No global/user-level symlink changes.
- No MATLAB content.
- No unrelated workflow protocol revisions.

## Implementation Steps

1. Create `.agents/skills/stata-data-analysis/SKILL.md` with front matter containing only `name` and `description`.
2. Frame the skill as a Stata-based empirical data-analysis workflow skill, not a narrow syntax helper.
3. Cover the five operating modes: data reconnaissance, variable/unit/missingness diagnosis, sample construction, exploratory/goal-directed analysis, and Stata code review/pipeline audit.
4. Include explicit external-data behavior: infer locations from code/docs when possible, ask for paths or access when needed, request permission before reading outside the workspace when required, never copy restricted data into the repo, and remain useful when data are inaccessible by reading code/docs, proposing diagnostic Stata commands, preparing an inspection plan, and labeling unverified points.
5. Include standards for data orientation, missingness, unit/scale checks, sample flow, merge diagnosis, regression preflight, readable Stata code, tables/figures, communication, boundaries, workflow integration, and optional subagent use.
6. Minimally update `README.md` and `.agents/skills/README.md`.
7. Verify the requested checks.
8. Update `PROJECT_STATE.md` after verification.

## Verification Steps

- Confirm `.agents/skills/stata-data-analysis/SKILL.md` exists.
- Confirm front matter contains only valid `name` and `description`.
- Confirm `.agents/skills/stata-data-analysis/` contains only `SKILL.md`.
- Confirm no scripts, hooks, automation, assets, or reference files were introduced.
- Confirm the skill covers all five operating modes.
- Confirm the skill includes external-data behavior, merge diagnosis, missingness diagnosis, unit/scale checks, readable Stata code standards, table/figure/output standards, code-review behavior, and explicit boundaries.
- Confirm README and skills README updates are minimal and accurate.
- Confirm `PROJECT_STATE.md` records the milestone only after verification.
- Confirm `git status --short` shows only intended files.

## Review Steps

Review the implementation against this approved plan, with emphasis on empirical safety, scope discipline, and whether the skill overpromises data access, causal interpretation, or subagent execution.

Review completed on 2026-05-20. The review found one front matter issue: the skill description needed quoting because it contained a colon. The issue was fixed and strict YAML parsing passed.

## Risks And Assumptions

- No separate requirements spec is needed because the requested behavior and acceptance checks are detailed.
- The skill remains instruction-only in this pass.
- Any independent subagent review will be read-only and used only to audit the skill/docs after implementation.

## Acceptance Criteria

The verification steps pass, review finds no unresolved blockers, and only intended files are changed.

## Approval

Approved by the user in conversation on 2026-05-20.

## Handoff Notes

Implemented, verified, and reviewed on 2026-05-20. The skill is instruction-only, documentation updates are minimal, and `PROJECT_STATE.md` records the verified milestone.
