# Project Skills

Skills can be repo-scoped or reusable across projects.

Repo-scoped skills live with a particular project or copied scaffold. They should describe local conventions, project-specific workflows, or recurring tasks that only make sense in that repository.

User-level reusable skills should be installed under the user's global skills directory when they need to be available across unrelated projects. `research-project-onboarding` is conceptually a reusable cross-project skill; this repo contains the canonical source implementation under `.agents/skills/research-project-onboarding/`. To invoke it in an arbitrary existing project that does not yet contain this scaffold, copy or install it into the user-level skills location or package it for broader distribution.

## Included Skills

- `research-project-onboarding`: canonical source implementation of a reusable cross-project skill for onboarding or Codex-enabling existing academic research projects.
- `stata-data-analysis`: canonical source implementation of the reusable cross-project Stata producer skill for empirical analysis and artifact generation.
- `review-stata`: canonical source implementation of the reusable cross-project read-only Stata reviewer skill for empirical pipelines, outputs, and reproducibility.
- `matlab-model-implementation`: canonical source implementation of the reusable cross-project MATLAB producer/modifier skill for quantitative economic model code.
- `review-matlab-model`: canonical source implementation of the reusable cross-project read-only MATLAB model reviewer skill.
- `matlab-quantitative-modeling`: temporary compatibility pointer to the MATLAB producer and reviewer skills.

Stata and MATLAB now have producer/reviewer skill splits. `matlab-quantitative-modeling` is retained temporarily for compatibility and may be removed after real-use testing.

Add skills only when the project has a clear recurring need. Keep each skill narrow, documented, and testable.
