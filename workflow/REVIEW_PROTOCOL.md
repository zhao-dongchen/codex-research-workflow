# Review Protocol

Review is adversarial but constructive. The goal is to find issues before they affect research conclusions or handoff quality.

## Review Priorities

Prioritize:

- Incorrect results or logic.
- Reproducibility failures.
- Hidden assumptions.
- Data provenance gaps.
- Fragile or unclear code.
- Missing tests or verification evidence.
- Incomplete plans or handoffs.
- Ambiguous interpretation of research outputs.

## Review Format

Substantial reviews should be saved under `quality_reports/reviews/` using `templates/review-report.md`.

Findings should come first. Each finding should include:

- Severity.
- A concise title.
- Evidence or file reference.
- Why it matters.
- Suggested fix or decision needed.

If no issues are found, say so clearly and state any remaining test gaps or residual risk.

## Review Independence

When possible, review should be performed from a fresh perspective after implementation and initial verification. The reviewer should challenge the plan, implementation, evidence, and final claims.
