# Focused Non-Public Workflow Upgrade Plan

## Status

Completed.

## Date Created

2026-05-20.

## Objective

Implement the remaining non-public-facing improvements from the recent repository review while preserving the scaffold's generic academic-research orientation.

## Scope

- Clarify the two existing-project onboarding scenarios in `README.md`.
- Correct the `AGENTS.md` `quality_reports/` inventory to include onboarding reports.
- Add the instruction-only `.agents/skills/research-project-onboarding/SKILL.md` skill.
- Clarify repo-scoped versus reusable user-level skills in `.agents/skills/README.md`.
- Update `PROJECT_STATE.md` after implementation and verification.

## Non-Scope

- No public-facing polish such as `LICENSE`, `CHANGELOG`, repo topics, or marketing text.
- No Stata or MATLAB domain-specific skills.
- No hooks, scripts, automation, or bundled skill resources.
- No unrelated file revisions.

## Implementation Steps

1. Update `README.md` to distinguish:
   - Case A: scaffold already exists in the target project.
   - Case B: target project does not yet contain the scaffold.
2. Add or revise copy-paste onboarding prompts so they mention `$research-project-onboarding` when available, request subagent support when appropriate, and handle Case B scaffold-source requirements.
3. Update the `AGENTS.md` Project Memory inventory sentence.
4. Add `.agents/skills/research-project-onboarding/SKILL.md` with valid front matter and instruction-only onboarding workflow guidance for both scenarios.
5. Update `.agents/skills/README.md` to distinguish repo-scoped skills from reusable user-level skills.
6. Verify all requested checks.
7. Update `PROJECT_STATE.md` with the completed milestone after verification.

## Verification Steps

- Confirm `README.md` distinguishes scaffold-present and scaffold-absent onboarding.
- Confirm both README onboarding paths include practical copy-paste prompts.
- Confirm Case B includes `Scaffold source: [LOCAL PATH OR GITHUB URL]` and is robust to `$research-project-onboarding` being unavailable.
- Confirm Case B asks for a scaffold source before exact file-level scaffold-integration planning.
- Confirm README prompts mention `$research-project-onboarding` where appropriate and request subagents when available.
- Confirm `AGENTS.md` includes onboarding reports in the `quality_reports/` inventory.
- Confirm `.agents/skills/research-project-onboarding/SKILL.md` exists with valid `name` and `description` front matter.
- Confirm the new skill is instruction-only and covers both onboarding scenarios.
- Confirm the skill distinguishes evidence, inference, assumptions, user-confirmed facts, and unresolved questions.
- Confirm `.agents/skills/README.md` distinguishes repo-scoped and user-level reusable skills.
- Confirm `PROJECT_STATE.md` records the milestone after verification.
- Confirm no public-facing issue-4 items were added.
- Confirm `git status --short` shows only intended files.

## Review Steps

Review the implementation against the approved plan, looking for unrelated wording changes, hidden scaffold assumptions in Case B, missing verification evidence, or accidental additions outside the requested scope.

Final focused audit before commit:

- `critical_reviewer` and `verifier` reviewed the implemented upgrade after implementation and initial verification.
- The audit found no substantive implementation blocker.
- The audit identified one bookkeeping/governance issue: this plan and `PROJECT_STATE.md` had already been marked completed or verified before the final focused audit was recorded.
- The issue was addressed before commit by recording this final audit and its resolution in the workflow records.

## Risks And Assumptions

- No requirements spec is needed because the implementation brief and acceptance checks are detailed.
- Subagents are not required for this implementation because the approved plan only documents subagent behavior for future onboarding use.
- The approved plan file is an intended workflow artifact under `quality_reports/plans/`.

## Acceptance Criteria

The verification steps pass, `PROJECT_STATE.md` records the completed milestone, and the final status shows only intended files changed.

## Approval

Approved by the user in conversation on 2026-05-20.

## Handoff Notes

Implemented, verified, and reviewed on 2026-05-20. `PROJECT_STATE.md` records the completed milestone, verification evidence, final focused audit, and resolved governance finding.
