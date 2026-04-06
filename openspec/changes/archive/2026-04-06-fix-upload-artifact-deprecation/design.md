## Context

The GitHub Actions workflow at `.github/workflows/deploy.yml` uses `actions/upload-artifact@v3` and `actions/download-artifact@v3` to pass the Hugo build output between the `build` and `deploy` jobs. GitHub deprecated v3 of these actions in April 2024 and now automatically fails any workflow run that references them.

## Goals / Non-Goals

**Goals:**
- Restore a passing CI/CD pipeline by upgrading both artifact actions to v4

**Non-Goals:**
- Refactoring the workflow structure or job dependencies
- Changing the deployment target or strategy
- Upgrading any other actions (e.g., `peaceiris/actions-hugo`, `actions/checkout`)

## Decisions

**Upgrade directly to v4 (no intermediary version)**
v4 is the current stable release and a drop-in replacement for v3 in this workflow. The artifact name (`public`) and path (`public/`) are unchanged. No API differences affect this use case.

**Update both actions together**
`upload-artifact` and `download-artifact` share a versioned protocol. Mismatching versions (e.g., upload v4 + download v3) would cause runtime failures, so both must be bumped in the same commit.

## Risks / Trade-offs

- **v4 artifact format is incompatible with v3** → Not a concern here since artifacts only live for 1 day (`retention-days: 1`) and are not consumed by anything outside this workflow.
- **No rollback needed** → The change is two line edits; reverting is trivial if an issue arises.
