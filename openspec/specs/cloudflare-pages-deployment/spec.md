## ADDED Requirements

### Requirement: Site deploys automatically from GitHub via Cloudflare Pages
The system SHALL deploy the Hugo site to Cloudflare Pages automatically on every push to the `main` branch, using the GitHub repository `kgeorgoudis/blacklines-website` as the source.

#### Scenario: Push to main triggers deployment
- **WHEN** a commit is pushed to the `main` branch on GitHub
- **THEN** Cloudflare Pages SHALL trigger a new build automatically
- **AND** the build output SHALL be served at the Cloudflare Pages project URL

#### Scenario: Build uses the correct Hugo version
- **WHEN** Cloudflare Pages runs the build
- **THEN** it SHALL use the Hugo version specified by the `HUGO_VERSION` environment variable
- **AND** the build SHALL fail with a clear error if `HUGO_VERSION` is not set or invalid

### Requirement: Build command produces minified output
The Cloudflare Pages build command SHALL be `hugo --minify`, producing optimized HTML, CSS, and JS in the `public/` output directory.

#### Scenario: Build output is in the public directory
- **WHEN** the build command completes successfully
- **THEN** the `public/` directory SHALL contain the full rendered site
- **AND** Cloudflare Pages SHALL serve files from `public/` as the static root

#### Scenario: Build fails fast on Hugo errors
- **WHEN** Hugo encounters a template or content error during build
- **THEN** the build SHALL exit with a non-zero status code
- **AND** Cloudflare Pages SHALL mark the deployment as failed and NOT update the live site

### Requirement: Custom domain `www.blacklines.gr` is served from Cloudflare Pages
The site SHALL be accessible at `https://www.blacklines.gr` via a Cloudflare Pages custom domain binding, with HTTPS enforced automatically.

#### Scenario: Custom domain resolves to Cloudflare Pages
- **WHEN** a visitor navigates to `https://www.blacklines.gr`
- **THEN** Cloudflare Pages SHALL serve the latest deployed build
- **AND** the TLS certificate SHALL be valid and automatically managed by Cloudflare

#### Scenario: Apex domain redirects to www
- **WHEN** a visitor navigates to `https://blacklines.gr` (apex)
- **THEN** the request SHALL redirect to `https://www.blacklines.gr` with HTTP 301

### Requirement: No provider-specific deployment config file exists in the repository
The repository SHALL NOT contain `render.yaml` or any Render-specific configuration. All Cloudflare Pages build settings (command, output dir, env vars) SHALL be configured via the Cloudflare dashboard.

#### Scenario: render.yaml is absent from the repository
- **WHEN** the repository is cloned
- **THEN** no `render.yaml` file SHALL exist in the root directory

#### Scenario: Cloudflare Pages builds without a wrangler.toml
- **WHEN** Cloudflare Pages pulls the repository and runs the build
- **THEN** the build SHALL succeed using only dashboard-configured settings
- **AND** no `wrangler.toml` file SHALL be required in the repository

### Requirement: Pull request branches generate preview deployments
Each pull request or non-main branch push SHALL automatically generate an isolated preview deployment URL on Cloudflare Pages.

#### Scenario: PR branch gets a preview URL
- **WHEN** a pull request is opened against `main`
- **THEN** Cloudflare Pages SHALL deploy the PR branch to a unique preview URL
- **AND** the preview URL SHALL be accessible without authentication
