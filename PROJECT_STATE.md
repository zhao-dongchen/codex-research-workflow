# Project State

Checked-in current state for Codex agents and human collaborators. Keep this file concise; put detailed
history, logs, reviews, plans, checkpoints, and score reports under `quality_reports/`.

## Current Purpose

Maintain a Codex-native academic research workflow scaffold for plan-first, evidence-based, reviewable
research work.

The scaffold is designed to be copied into empirical or quantitative research projects and specialized with
project-specific data, model, software, and collaboration conventions.

## Current Scaffold Status

- Main constitution: `AGENTS.md`.
- Shared protocol/reference library: `workflow/`.
- Reusable templates: `templates/`.
- Durable reports: `quality_reports/`.
- Repo-scoped skills: `.agents/skills/`.
- Read-only project subagents: `.codex/agents/`.
- Subagent references: `.codex/agents/references/`.

No active implementation plan is currently recorded.

## Active Workflow Loop

Full workflow mode:

```text
PRE-EXPLORE -> PLAN -> IMPLEMENT -> VERIFY -> REVIEW -> FIX -> RE-VERIFY -> SCORE -> SUMMARIZE
```

Lightweight inspection or planning may skip implementation, review, and scoring when the user asks only for
exploration, planning, or summary.

## Active Skills

- `research-project-onboarding`: onboard or Codex-enable existing academic research projects.
- `stata-data-prep-exploration`: inspect Stata data, sample construction, keys, merges, and cleaning needs.
- `empirical-analysis-planner`: map research questions to empirical strategy, variables, samples, and outputs.
- `stata-data-analysis`: produce Stata do-files, regressions, tables, figures, logs, and documentation.
- `matlab-model-planner`: plan, diagnose, and map MATLAB quantitative model design before implementation.
- `matlab-model-builder`: build or revise MATLAB model code with proportionate validation and integration checks.

## Active Subagents

- `research_explorer`: read-only context mapping and repository inspection.
- `verifier`: read-only evidence, output, command, and reproducibility checks.
- `critical_reviewer`: read-only adversarial review of plans, code, outputs, reasoning, and handoff quality.
- `stata_reviewer`: independent Stata reviewer using `.codex/agents/references/stata-review-protocol.md`.
- `matlab_reviewer`: independent MATLAB reviewer using `.codex/agents/references/matlab-review-protocol.md`.

Subagents use `.codex/agents/references/subagent-resource-policy.md` for cost-aware scope and escalation
decisions. Do not claim a subagent was used unless it actually ran.

## Current Quality Policy

- Plan first for nontrivial or ambiguous tasks.
- Verify before completion claims, or clearly state why verification was not possible.
- Use independent review for substantial work when requested or runtime-authorized.
- Score full workflow and substantial research-code or research-output tasks before final summary.
- Treat `workflow/` as a shared protocol/reference library, not automatic rules.
- Review does not replace verification. Score does not replace evidence.
- Review and verification depth should be proportionate to task complexity and result implications.

Score thresholds from `workflow/QUALITY_SCORE_PROTOCOL.md`:

- `<70`: do not present as complete.
- `70-79`: partial; needs user review.
- `80-89`: usable internal research output.
- `90-94`: strong research draft output.
- `95+`: polished, low-risk output.

## Open Issues / Next Actions

- Test the full empirical workflow on a larger real or representative Stata task.
- Test the full MATLAB workflow on a larger real or representative model-code task.
- Do not add hooks or new agents until the manual Codex-native workflow has been exercised.

## Last Verified State

- 2026-05-20: Stata review was routed to `stata_reviewer`; the obsolete Stata review procedure was removed
  from active skills.
- 2026-05-20: Stata full-workflow smoke test passed; temporary toy artifacts were removed afterward.
- 2026-05-21: MATLAB workflow was reorganized around `matlab-model-planner`, `matlab-model-builder`, and
  `matlab_reviewer`.
- 2026-05-21: Subagent resource policy was added for proportionate review scope.
- 2026-05-21: MATLAB toy transition-matrix smoke test passed; score report recorded `94`.
