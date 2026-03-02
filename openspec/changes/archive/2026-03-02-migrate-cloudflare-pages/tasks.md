## 1. Cloudflare Pages Project Setup (Dashboard)

- [x] 1.1 Create a new Cloudflare Pages project in the Cloudflare dashboard, connected to the `kgeorgoudis/blacklines-website` GitHub repository
- [x] 1.2 Set the production branch to `main`
- [x] 1.3 Set build command to `hugo --minify` and output directory to `public`
- [x] 1.4 Add environment variable `HUGO_VERSION` set to the latest stable Hugo release (check https://github.com/gohugoio/hugo/releases for current version)
- [x] 1.5 Verify the first automatic build succeeds (will fail until theme is configured — that is expected; proceed to section 2)

## 2. Initialize Hugo Modules

- [x] 2.1 Run `hugo mod init github.com/kgeorgoudis/blacklines-website` in the repo root to create `go.mod`
- [x] 2.2 Add the Blowfish theme as a Hugo Module: run `hugo mod get github.com/nunocoracao/blowfish/v2` (or current module path — verify at https://blowfish.page/docs/installation/)
- [x] 2.3 Confirm `go.mod` and `go.sum` are created with the Blowfish dependency pinned

## 3. Update hugo.toml for Blowfish

- [x] 3.1 Replace `theme = 'minimal'` with the Hugo Modules theme config (`theme = ["github.com/nunocoracao/blowfish/v2"]` or equivalent per Blowfish docs)
- [x] 3.2 Add Blowfish required params to `hugo.toml` (e.g., `colorScheme`, `defaultAppearance = "auto"`) — refer to Blowfish documentation for minimal required params
- [x] 3.3 Verify the three menu entries (DIY, Sketchnotes, DevOps) remain correctly defined in `hugo.toml`
- [x] 3.4 Set site-wide Blowfish defaults in `[params]` to avoid per-post front matter requirements (e.g., `showToc = false`, `showReadingTime = false` if not desired)

## 4. Remove Old Theme and Clean Up

- [x] 4.1 Delete the `themes/minimal/` directory from the repository
- [x] 4.2 Remove `build.sh` from the repository (build command is now set directly in Cloudflare Pages dashboard)
- [x] 4.3 Review `layouts/` directory and remove any overrides that were specific to the `minimal` theme; keep only overrides that add site-specific customisation
- [x] 4.4 Review `assets/` and `static/` for any minimal-theme-specific files; remove if no longer needed

## 5. Local Build Verification

- [x] 5.1 Run `hugo server` locally to confirm the site renders without errors or warnings
- [x] 5.2 Verify section list pages at `/diy/`, `/sketchnotes/`, and `/devops/` render correctly
- [x] 5.3 Verify dark/light mode switches automatically with OS preference
- [x] 5.4 Run `hugo --minify` and confirm exit code 0 with no ERROR or WARN lines in output
- [x] 5.5 Commit all changes (`go.mod`, `go.sum`, updated `hugo.toml`, removed `themes/minimal/`, removed `build.sh`) and push to a feature branch

## 6. Cloudflare Pages Deployment Verification

- [x] 6.1 Confirm Cloudflare Pages triggers a build on the feature branch and the build succeeds
- [x] 6.2 Open the Cloudflare Pages preview URL for the feature branch and verify the site renders correctly
- [x] 6.3 Check that all three navigation sections (DIY, Sketchnotes, DevOps) are accessible via the preview URL
- [x] 6.4 Merge the feature branch to `main` and confirm the production deployment succeeds

## 7. Custom Domain Cutover

- [x] 7.1 In Cloudflare Pages dashboard, add `www.blacklines.gr` as a custom domain
- [x] 7.2 Confirm Cloudflare automatically creates the required CNAME DNS record (since DNS is managed by Cloudflare, this is automatic)
- [x] 7.3 Verify `https://www.blacklines.gr` serves the site with a valid TLS certificate
- [x] 7.4 Verify that `https://blacklines.gr` (apex) redirects to `https://www.blacklines.gr`

## 8. Render Teardown

- [x] 8.1 Delete the Render service for `blacklines-website` from the Render dashboard (only after step 7.3 is confirmed)
- [x] 8.2 Remove `render.yaml` from the repository and commit
- [x] 8.3 Push the removal commit to `main` and confirm Cloudflare Pages deployment succeeds without `render.yaml`
