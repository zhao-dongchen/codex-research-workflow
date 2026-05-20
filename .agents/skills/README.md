# Project Skills

Skills can be repo-scoped or reusable across projects.

Repo-scoped skills live with a particular project or copied scaffold. They should describe local conventions, project-specific workflows, or recurring tasks that only make sense in that repository.

User-level reusable skills should be installed under the user's global skills directory when they need to be available across unrelated projects. `research-project-onboarding` is conceptually a reusable cross-project skill; this repo contains the canonical source implementation under `.agents/skills/research-project-onboarding/`. To invoke it in an arbitrary existing project that does not yet contain this scaffold, copy or install it into the user-level skills location or package it for broader distribution.

## Included Skills

- `research-project-onboarding`: canonical source implementation of a reusable cross-project skill for onboarding or Codex-enabling existing academic research projects.
- `stata-data-analysis`: canonical source implementation of a reusable cross-project empirical-analysis skill for Stata-based research workflows.
- `matlab-quantitative-modeling`: canonical source implementation of a reusable cross-project quantitative-modeling skill for MATLAB-based economic modeling workflows.

`stata-data-analysis` and `matlab-quantitative-modeling` are broad v0.1 workflow skills. They may later be refactored into narrower Pedro-style producer/reviewer skills, such as `review-stata`, `matlab-model-implementation`, and `review-matlab-model`.

Add skills only when the project has a clear recurring need. Keep each skill narrow, documented, and testable.
