## Why

The site is currently hosted on Render.com, which requires maintaining a `render.yaml` service config and has limited control over the Hugo build environment. Migrating to Cloudflare Pages provides a global CDN, native Hugo support, easier environment variable management, and free bandwidth—removing the need for provider-specific build scaffolding and unlocking the latest Hugo features and themes without compatibility constraints.

## What Changes

- **BREAKING**: Remove `render.yaml` (Render-specific deployment config)
- Add Cloudflare Pages build configuration (`wrangler.toml` or dashboard-only setup via env vars)
- Pin Hugo to latest stable version via `HUGO_VERSION` environment variable in Cloudflare Pages
- Replace or upgrade the current custom `minimal` theme with a modern, well-maintained Hugo theme that supports current Hugo features (e.g., Hugo Modules, partials, i18n, dark mode)
- Update `hugo.toml` as needed to align with the chosen theme's configuration schema
- Remove `build.sh` if Cloudflare Pages native build handles the same steps
- Configure custom domain (`www.blacklines.gr`) in Cloudflare Pages (DNS managed via Cloudflare)

## Capabilities

### New Capabilities
- `cloudflare-pages-deployment`: Configure and document the Cloudflare Pages project setup—build command, output directory, Hugo version env var, and custom domain binding—replacing the Render-based deployment pipeline.
- `hugo-theme-upgrade`: Select and integrate a modern Hugo theme (replacing the current custom `minimal` theme) with support for latest Hugo features such as Hugo Modules, responsive layout, dark/light mode toggle, and portfolio-friendly content types (DIY, Sketchnotes, DevOps).

### Modified Capabilities

<!-- No existing spec-level capabilities are being modified. -->

## Impact

- `render.yaml`: Removed (Render deployment config no longer needed)
- `build.sh`: Potentially removed or kept as local dev helper only
- `hugo.toml`: Updated to reference new theme and any theme-required parameters
- `themes/minimal/`: Replaced by a new theme (via Hugo Modules or `themes/<new-theme>/` directory)
- `layouts/`, `assets/`, `static/`: May need partial cleanup or migration depending on chosen theme's override conventions
- `content/`: No structural changes expected; front matter may need minor adjustments to match new theme conventions
