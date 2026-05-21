# Subagent Resource Policy

Subagents consume additional model, tool, and review work. Use them deliberately.

## Default Policy

- Do not spawn reviewers automatically for trivial tasks.
- Use the narrowest useful reviewer.
- Do not spawn multiple reviewers unless their scopes are genuinely different.
- Prefer default or lighter model/reasoning settings for routine checks.
- Escalate model/reasoning effort only when complexity or result implications justify it.
- If a task is resource-constrained, prioritize likely failure points instead of exhaustively reviewing everything.

## Use Deeper Review For

- headline result changes
- nonstandard numerical methods
- complex MATLAB solvers, transitions, distributions, simulations, moments, or estimation
- Stata sample construction, merges, weights, fixed effects, clustering, or identification-sensitive results
- conflicting evidence between code, output, and paper claims
- unresolved blocker or major issues

## Use Lighter Review For

- documentation-only changes
- formatting
- simple wrappers
- toy smoke tests
- small low-risk refactors

## Evidence Boundary

Reviewers and verifiers can recommend additional tests, but they do not replace execution evidence when execution is needed. Recommend additional checks only when they are likely to change correctness, reproducibility, or interpretation.
