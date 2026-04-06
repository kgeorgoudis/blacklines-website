## ADDED Requirements

### Requirement: Workflow uses upload-artifact v4
The CI workflow SHALL use `actions/upload-artifact@v4` to upload the Hugo build output between jobs.

#### Scenario: Build artifacts uploaded successfully
- **WHEN** the `build` job completes successfully
- **THEN** the `public/` directory SHALL be uploaded as an artifact named `public` using `actions/upload-artifact@v4`

### Requirement: Workflow uses download-artifact v4
The CI workflow SHALL use `actions/download-artifact@v4` to retrieve the Hugo build output in the deploy job.

#### Scenario: Build artifacts downloaded successfully
- **WHEN** the `deploy` job starts
- **THEN** the artifact named `public` SHALL be downloaded to `public/` using `actions/download-artifact@v4`

### Requirement: No deprecated artifact action versions
The CI workflow SHALL NOT reference `actions/upload-artifact@v3` or `actions/download-artifact@v3`.

#### Scenario: Workflow passes GitHub Actions validation
- **WHEN** the workflow is triggered on a push to `main`
- **THEN** GitHub Actions SHALL NOT automatically fail the run due to deprecated action versions
