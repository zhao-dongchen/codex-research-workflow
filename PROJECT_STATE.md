# Project State

Checked-in current state for Codex agents and human collaborators. Keep this file concise; put detailed history, logs, reviews, plans, checkpoints, and score reports under `quality_reports/`.

## Current Purpose

Maintain a Codex-native academic research workflow scaffold for plan-first, evidence-based, reviewable research work.

The scaffold is designed to be copied into empirical or quantitative research projects and then specialized with project-specific data, model, software, and collaboration conventions.

## Current Scaffold Status

- Main constitution: `AGENTS.md`.
- Shared protocol/reference library: `workflow/`.
- Reusable templates: `templates/`.
- Durable reports: `quality_reports/`.
- Repo-scoped skills: `.agents/skills/`.
- Read-only project subagents: `.codex/agents/`.
- Subagent references: `.codex/agents/references/`.
- Subagent resource policy: `.codex/agents/references/subagent-resource-policy.md`.
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
- `matlab-model-planner`: plan, diagnose, and map MATLAB quantitative model design before implementation.
- `matlab-model-builder`: build or revise coherent MATLAB quantitative model code with proportionate validation and integration/sanity checks.
- `matlab-model-implementation`: legacy compatibility pointer to MATLAB planner/builder routing.
- `matlab-quantitative-modeling`: broad compatibility pointer to the current MATLAB workflow.

## Available Subagents

- `research_explorer`: read-only context mapping and repository inspection.
- `verifier`: read-only evidence, output, command, and reproducibility checks.
- `critical_reviewer`: read-only adversarial review of plans, code, outputs, reasoning, and handoff quality.
- `stata_reviewer`: independent read-only Stata reviewer subagent.
- `matlab_reviewer`: independent read-only MATLAB quantitative model reviewer subagent.

`stata_reviewer` applies `.codex/agents/references/stata-review-protocol.md`. Subagents should only be claimed when actually used. If the main agent applies the Stata review protocol itself, label the review non-independent.

`matlab_reviewer` applies `.codex/agents/references/matlab-review-protocol.md`. MATLAB review is not a skill. Economic model logic is covered by `matlab_reviewer`; use `critical_reviewer` for broader adversarial research-claim review when useful.

Subagents use `.codex/agents/references/subagent-resource-policy.md` for cost-aware scope and escalation decisions.

## Current Quality Gates

- Plan-first work for nontrivial or ambiguous tasks.
- Data governance before working with data, logs, credentials, sensitive materials, or durable reports.
- Verification before completion claims.
- Independent review for substantial work when requested or runtime-authorized.
- Quality scoring for full workflow mode and substantial research-code or research-output tasks.
- In full workflow mode, SCORE is required before SUMMARIZE.
- `workflow/` is a shared protocol/reference library, not automatic rules.
- Score thresholds from `workflow/QUALITY_SCORE_PROTOCOL.md`:
  - `<70`: do not present as complete.
  - `70-79`: partial; needs user review.
  - `80-89`: usable internal research output.
  - `90-94`: strong research draft output.
  - `95+`: polished, low-risk output.
- Score does not replace verification or review. Review does not replace execution evidence. Direct manual actions can bypass the score system.
- Review and verification depth should be proportionate to task complexity and result implications.

## Open Issues / Next Actions

- Test the full empirical workflow on a larger real or representative Stata task.
- Test the full MATLAB workflow on a larger real or representative model-code task.
- Decide later whether `matlab-quantitative-modeling` should remain as a compatibility pointer or be removed.
- Do not add hooks or new agents until the manual Codex-native workflow has been exercised.

## Last Verified State

2026-05-20 Codex-native architecture cleanup:

- `AGENTS.md` is now a short top-level constitution.
- Stata review is routed to `stata_reviewer`, with checklist/reference material in `.codex/agents/references/stata-review-protocol.md`.
- `workflow/` is described as a shared protocol/reference library, not an automatic rule mechanism.
- The obsolete Stata review procedure was removed from the active skill inventory.

2026-05-20 Stata workflow smoke test:

- Stata full-workflow smoke test passed on 2026-05-20; temporary toy artifacts were removed afterward.

2026-05-21 MATLAB workflow architecture update:

- MATLAB workflow now uses `matlab-model-planner` for design/planning and `matlab-model-builder` for coherent whole-model construction with adaptive high-risk component validation and probes.
- MATLAB review is routed to `matlab_reviewer` using `.codex/agents/references/matlab-review-protocol.md`; the obsolete MATLAB review procedure was removed from the active skill inventory.

2026-05-21 Resource-aware review update:

- Added `.codex/agents/references/subagent-resource-policy.md` and updated reviewer/verifier instructions to use proportionate scope rather than exhaustive review by default.

2026-05-21 MATLAB workflow smoke test:

- A toy off-grid transition-matrix and distribution-update MATLAB smoke test passed under `quality_reports/session_logs/matlab_workflow_test/`.
- Final score report: `quality_reports/scores/2026-05-21-matlab-workflow-smoke-test.md` with score `94`.
