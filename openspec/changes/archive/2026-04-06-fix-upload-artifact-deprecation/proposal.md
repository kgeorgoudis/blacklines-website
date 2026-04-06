## Why

GitHub Actions build fails because `actions/upload-artifact@v3` and `actions/download-artifact@v3` are deprecated as of April 2024 and now automatically fail. The CI/CD pipeline must be unblocked immediately.

## What Changes

- Upgrade `actions/upload-artifact` from `v3` to `v4` in `.github/workflows/deploy.yml`
- Upgrade `actions/download-artifact` from `v3` to `v4` in `.github/workflows/deploy.yml`

## Capabilities

### New Capabilities
- `github-actions-artifact-v4`: GitHub Actions workflow using v4 of the official artifact upload/download actions

### Modified Capabilities
<!-- No existing specs cover CI/CD workflow requirements -->

## Impact

- `.github/workflows/deploy.yml` — two action references updated (lines 31 and 48)
- No changes to build logic, deployment steps, or secrets
