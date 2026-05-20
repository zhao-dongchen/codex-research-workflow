# Project Skills

Skills can be repo-scoped or reusable across projects.

Repo-scoped skills live with a particular project or copied scaffold. They should describe local conventions, project-specific workflows, or recurring tasks that only make sense in that repository.

User-level reusable skills should be installed under the user's global skills directory when they need to be available across unrelated projects. `research-project-onboarding` is conceptually a reusable cross-project skill; this repo contains the canonical source implementation under `.agents/skills/research-project-onboarding/`. To invoke it in an arbitrary existing project that does not yet contain this scaffold, copy or install it into the user-level skills location or package it for broader distribution.

No substantive domain-specific skills are included in the initial scaffold. This is intentional: the base workflow should remain portable across academic research projects.

Potential future skills may include:

- Stata empirical-analysis workflows.
- MATLAB quantitative-model coding workflows.

Future Stata and MATLAB skills may be reusable user-level skills or project-specific skills depending on their scope.

Add skills only when the project has a clear recurring need. Keep each skill narrow, documented, and testable.
