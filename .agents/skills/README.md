# Project Skills

Skills are reusable producer or planner workflows. Reviewers and verifiers belong in `.codex/agents/`, not in `.agents/skills/`.

## Included Skills

- `research-project-onboarding`: canonical source implementation for onboarding or Codex-enabling existing academic research projects.
- `stata-data-prep-exploration`: Stata data orientation, missingness, keys, merges, and minimal cleaning plans.
- `empirical-analysis-planner`: empirical strategy planning from available project and data evidence.
- `stata-data-analysis`: Stata producer workflow for empirical analysis code, diagnostics, logs, tables, figures, and output manifests.
- `matlab-model-planner`: MATLAB quantitative model design, diagnosis, and implementation planning.
- `matlab-model-builder`: MATLAB whole-model construction and revision with proportionate validation, probes, integration checks, and speed/memory discipline.

Stata review is performed by `stata_reviewer`, which applies `.codex/agents/references/stata-review-protocol.md`.

MATLAB review is performed by `matlab_reviewer`, which applies `.codex/agents/references/matlab-review-protocol.md`.

Subagents use `.codex/agents/references/subagent-resource-policy.md` for cost-aware scope and escalation decisions. Add skills only when the project has a clear recurring producer or planner need.
