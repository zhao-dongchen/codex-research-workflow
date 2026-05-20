# Project Skills

Skills can be repo-scoped or reusable across projects.

Repo-scoped skills live with a particular project or copied scaffold. They should describe local conventions, project-specific workflows, or recurring tasks that only make sense in that repository.

User-level reusable skills should be installed under the user's global skills directory when they need to be available across unrelated projects. `research-project-onboarding` is conceptually a reusable cross-project skill; this repo contains the canonical source implementation under `.agents/skills/research-project-onboarding/`. To invoke it in an arbitrary existing project that does not yet contain this scaffold, copy or install it into the user-level skills location or package it for broader distribution.

`stata-data-analysis` is the canonical source implementation of a reusable cross-project empirical-analysis skill for Stata-based research workflows. It is suitable for later user-level installation when Stata empirical support is needed across unrelated projects.

`matlab-quantitative-modeling` is the canonical source implementation of a reusable cross-project quantitative-modeling skill for MATLAB-based economic modeling workflows. It is suitable for later local installation in relevant projects.

Add skills only when the project has a clear recurring need. Keep each skill narrow, documented, and testable.
