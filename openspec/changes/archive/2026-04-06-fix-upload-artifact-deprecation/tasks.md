## 1. Update Workflow File

- [x] 1.1 In `.github/workflows/deploy.yml` line 31, change `actions/upload-artifact@v3` to `actions/upload-artifact@v4`
- [x] 1.2 In `.github/workflows/deploy.yml` line 48, change `actions/download-artifact@v3` to `actions/download-artifact@v4`

## 2. Verify

- [ ] 2.1 Commit and push the change to trigger a GitHub Actions run
- [ ] 2.2 Confirm the `build` job passes (no deprecated action error)
- [ ] 2.3 Confirm the `deploy` job passes and deployment is triggered
