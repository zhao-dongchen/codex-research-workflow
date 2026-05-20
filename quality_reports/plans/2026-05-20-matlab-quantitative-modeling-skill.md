# Add `matlab-quantitative-modeling` Skill

## Status

Completed.

## Date Created

2026-05-20.

## Objective

Add an instruction-only reusable skill for MATLAB-based quantitative economic modeling.

## Scope

- Add `.agents/skills/matlab-quantitative-modeling/SKILL.md`.
- Minimally update `README.md` and `.agents/skills/README.md` to mention the new canonical reusable MATLAB quantitative-modeling skill.
- Update `PROJECT_STATE.md` after implementation and verification.
- Save this approved plan under `quality_reports/plans/`.

## Non-Scope

- No helper scripts, hooks, automation, assets, or reference files.
- No separate MATLAB reviewer agent.
- No generated-code helpers.
- No global/user-level setup changes.
- No Stata skill revisions.
- No unrelated workflow protocol revisions.

## Implementation Steps

1. Create `.agents/skills/matlab-quantitative-modeling/SKILL.md` with front matter containing only `name` and `description`.
2. Frame the skill as a quantitative economic modeling workflow skill, not generic MATLAB help.
3. Cover the six operating modes: model-code reconnaissance, numerical implementation/revision, distribution/simulation/moments, calibration/estimation/optimization, nonstandard numerical structure awareness, and MATLAB code review/readability/performance audit.
4. Include a dedicated `Efficiency and Memory Discipline` section covering vectorization, memory pressure, preallocation, caching, sparse structures, expensive object construction, bottleneck identification, profiling/timing, and preservation of economic meaning and numerical validity.
5. Include standards for preserving economic logic, timing, constraints, equilibrium/fixed-point objects, moments, simulation/distribution logic, optimizer behavior, generated-code/toolchain boundaries, human-readable quantitative code, evidence discipline, and optional use of available agents.
6. Add read-only default behavior for review/audit requests.
7. Minimally update `README.md` and `.agents/skills/README.md`.
8. Verify the requested checks.
9. Update `PROJECT_STATE.md` after verification.

## Verification Steps

- Confirm `.agents/skills/matlab-quantitative-modeling/SKILL.md` exists.
- Confirm front matter parses as valid YAML and contains only `name` and `description`.
- Confirm `.agents/skills/matlab-quantitative-modeling/` contains only `SKILL.md`.
- Confirm no scripts, hooks, automation, assets, or reference files were introduced.
- Confirm the skill covers all six operating modes.
- Confirm the skill includes model-code reconnaissance, distribution/simulation/moments guidance, calibration/estimation/optimization guidance, nonstandard numerical structure awareness, code review/readability/performance guidance, a dedicated efficiency and memory discipline section, human-readable quantitative code standards, generated-code/toolchain caution, explicit boundaries, and optional available-agent guidance.
- Confirm README and skills README updates are minimal and accurate.
- Confirm `PROJECT_STATE.md` records the milestone only after verification.
- Confirm `git status --short` shows only intended files.

## Review Steps

Review the implementation against this approved plan, with emphasis on quantitative-model safety, scope discipline, and whether the skill overpromises model understanding, numerical correctness, performance improvements, or subagent execution.

Review completed on 2026-05-20. No unresolved blockers were found.

## Risks And Assumptions

- No separate requirements spec is needed because the requested behavior and acceptance checks are detailed.
- The skill remains instruction-only in this pass.
- Any independent subagent audit after implementation will be read-only and focused on the new skill and minimal documentation updates.

## Acceptance Criteria

The verification steps pass, review finds no unresolved blockers, and only intended files are changed.

## Approval

Approved by the user in conversation on 2026-05-20.

## Handoff Notes

Implemented, verified, and reviewed on 2026-05-20. The skill is instruction-only, documentation updates are minimal, and `PROJECT_STATE.md` records the verified milestone.
