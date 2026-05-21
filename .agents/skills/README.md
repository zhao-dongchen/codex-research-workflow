# Project Skills

Skills can be repo-scoped or reusable across projects.

Repo-scoped skills live with a particular project or copied scaffold. They should describe local conventions, project-specific workflows, or recurring tasks that only make sense in that repository.

User-level reusable skills should be installed under the user's global skills directory when they need to be available across unrelated projects. `research-project-onboarding` is conceptually a reusable cross-project skill; this repo contains the canonical source implementation under `.agents/skills/research-project-onboarding/`. To invoke it in an arbitrary existing project that does not yet contain this scaffold, copy or install it into the user-level skills location or package it for broader distribution.

## Included Skills

- `research-project-onboarding`: canonical source implementation of a reusable cross-project skill for onboarding or Codex-enabling existing academic research projects.
- `stata-data-prep-exploration`: canonical source implementation of the reusable cross-project Stata data-prep and data-orientation skill.
- `empirical-analysis-planner`: canonical source implementation of the reusable cross-project empirical-analysis planning skill.
- `stata-data-analysis`: canonical source implementation of the reusable cross-project Stata producer skill for empirical analysis code and artifact generation.
- `matlab-model-planner`: reusable MATLAB quantitative model design, diagnosis, and implementation-planning skill.
- `matlab-model-builder`: reusable MATLAB whole-model producer skill for coherent construction, proportionate high-risk component validation, probes, integration checks, and speed/memory discipline.
- `matlab-model-implementation`: legacy compatibility pointer to `matlab-model-planner` and `matlab-model-builder`.
- `matlab-quantitative-modeling`: broad compatibility pointer to the current MATLAB planner, builder, reviewer subagent, verifier, and score workflow.

Stata review is performed by the independent read-only project subagent `stata_reviewer`, which applies `.codex/agents/references/stata-review-protocol.md`. Stata review is not a skill.

MATLAB review is performed by the independent read-only project subagent `matlab_reviewer`, which applies `.codex/agents/references/matlab-review-protocol.md`. MATLAB review is not a skill. Economic model logic is covered by `matlab_reviewer`; use `critical_reviewer` when a broader adversarial research-claim review is useful.

Subagents use `.codex/agents/references/subagent-resource-policy.md` for cost-aware scope and escalation decisions.

Add skills only when the project has a clear recurring need. Keep each skill narrow, documented, and testable.
