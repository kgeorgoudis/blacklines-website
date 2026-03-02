## Context

The site (`www.blacklines.gr`) is a Hugo-based portfolio with three content sections—DIY, Sketchnotes, and DevOps—currently deployed on Render.com via `render.yaml`. The current custom `minimal` theme was built as a workaround after encountering Hugo version compatibility issues with community themes. Cloudflare Pages natively supports Hugo deployments linked to GitHub, with a simpler environment variable model and global CDN without bandwidth billing.

The GitHub repository (`kgeorgoudis/blacklines-website`) remains the source of truth; only the deployment target changes.

## Goals / Non-Goals

**Goals:**
- Replace Render deployment with Cloudflare Pages, linked to the existing GitHub repo
- Pin Hugo to the latest stable version via `HUGO_VERSION` env var on Cloudflare Pages
- Replace the custom `minimal` theme with a modern, actively-maintained Hugo community theme
- Preserve existing content structure (`content/diy/`, `content/sketchnotes/`, `content/devops/`) without restructuring posts
- Keep `www.blacklines.gr` as the live domain

**Non-Goals:**
- Migrating or restructuring content files
- Adding new content sections or features beyond what the new theme supports out of the box
- Setting up preview deployments or branch-specific environments (can be enabled later)
- Changing the domain registrar or primary DNS zone (Cloudflare DNS already manages this domain)

## Decisions

### Decision 1: No `wrangler.toml` — dashboard-configured build

Cloudflare Pages static sites do not require a config file in the repo. Build command, output directory, and environment variables are all set in the Cloudflare dashboard (or via Wrangler CLI once during setup). A `wrangler.toml` is only needed for Pages Functions (serverless) — not applicable here.

**Chosen**: Dashboard + GitHub integration only. No new config file added to the repository.

**Alternative considered**: `wrangler.toml` in repo — adds vendor lock-in artifact and complexity without benefit for a pure static site.

---

### Decision 2: Remove `build.sh`, use `hugo --minify` as build command directly

The current `build.sh` only runs `hugo`. Cloudflare Pages accepts any shell command as the build command, so `hugo --minify` can be used directly without a wrapper script. Keeping `build.sh` as the build command is also valid but adds an extra indirection layer.

**Chosen**: Remove `build.sh` from the deployment pipeline. Set build command in Cloudflare Pages dashboard to `hugo --minify`.

**Alternative considered**: Keep `build.sh` — no benefit for Cloudflare Pages; `build.sh` can still be kept for local builds if useful.

---

### Decision 3: Theme — Blowfish (recommended) over PaperMod, Congo, Gokarna

The site has previously tried Ananke and Hugo Book (incompatibility issues at the time). With the latest Hugo, all major themes are now compatible. Evaluation:

| Theme | Hugo Modules | Dark Mode | Portfolio Support | Activity |
|-------|-------------|-----------|------------------|----------|
| **Blowfish** | ✅ | ✅ auto | ✅ taxonomy + hero | Very active |
| **PaperMod** | ❌ (git) | ✅ | ✅ good | Active |
| **Congo** | ✅ | ✅ auto | ✅ similar to Blowfish | Active |
| **Gokarna** | ❌ (git) | ✅ | ⚠️ blog-focused | Moderate |

**Chosen**: **Blowfish** — supports Hugo Modules (clean, no git submodule), has automatic dark/light mode, portfolio-friendly layouts, and actively maintained. The three content sections (DIY, Sketchnotes, DevOps) map well to its taxonomy and list page system.

**Fallback**: If Blowfish layout doesn't suit the portfolio aesthetic, Congo is architecturally identical and equally capable.

> **Open question**: See Open Questions — the user should confirm theme choice before implementation.

---

### Decision 4: Install theme via Hugo Modules (not git submodule or directory copy)

Hugo Modules is the modern, recommended way to manage Hugo themes. It uses `go.mod`/`go.sum` for version pinning and eliminates the `themes/` directory vendor lock-in.

**Chosen**: Hugo Modules. Initialize with `hugo mod init`, add theme as a module dependency, remove `themes/minimal/`.

**Alternative considered**: Copy theme into `themes/<new-theme>/` — simpler but not idiomatic for modern Hugo; complicates updates.

---

### Decision 5: Cloudflare Pages environment variables

Mirror what Render currently sets, adapted for Cloudflare Pages:

| Variable | Value | Notes |
|----------|-------|-------|
| `HUGO_VERSION` | latest stable (e.g., `0.147.0`) | Required by Cloudflare Pages to select Hugo binary |
| `DART_SASS_VERSION` | `1.97.3` | Set only if new theme uses SCSS with Dart Sass |

`GO_VERSION` and `NODE_VERSION` are not needed — Cloudflare Pages manages these internally for the Hugo build environment.

## Risks / Trade-offs

- **Theme content compatibility** → Front matter keys (e.g., `draft`, `tags`, `categories`) are standard Hugo and will transfer. Theme-specific keys (e.g., `showToc`, `cover`) may need to be added per post for full feature use. Mitigation: defaults can be set in `hugo.toml` params to apply site-wide.

- **Hugo Modules requires Go** → Local development requires Go installed to run `hugo mod get`. CI (Cloudflare Pages) handles Go automatically. Mitigation: document in README; `go.mod` pins the exact version.

- **DNS cutover window** → Pointing `www.blacklines.gr` to Cloudflare Pages CNAME will have a brief TTL propagation window. Mitigation: lower TTL before cutover, verify with Cloudflare Pages preview URL first.

- **Render teardown** → Once `render.yaml` is removed and the Render service deleted, rollback requires re-creating the service. Mitigation: keep `render.yaml` in a branch until Cloudflare Pages deployment is verified stable.

## Migration Plan

1. Create Cloudflare Pages project linked to `kgeorgoudis/blacklines-website` GitHub repo (dashboard)
2. Set `HUGO_VERSION` (and optionally `DART_SASS_VERSION`) in Cloudflare Pages environment variables
3. Set build command: `hugo --minify`, output directory: `public`
4. Initialize Hugo Modules in repo (`hugo mod init github.com/kgeorgoudis/blacklines-website`)
5. Add chosen theme as Hugo Module dependency and update `hugo.toml`
6. Remove `themes/minimal/` directory; clean up `layouts/`, `assets/` of theme-specific overrides
7. Verify build succeeds on Cloudflare Pages preview URL
8. Add custom domain `www.blacklines.gr` in Cloudflare Pages; Cloudflare DNS auto-creates CNAME
9. Verify live site at `www.blacklines.gr`
10. Remove `render.yaml` and delete Render service
11. Optionally remove `build.sh` (or keep for local dev convenience)

**Rollback**: Keep Render service running until step 9 is verified. DNS revert is instant via Cloudflare dashboard.

## Open Questions

1. **Theme selection**: Blowfish is recommended, but user should confirm. If a different theme is preferred, the Hugo Modules approach and `hugo.toml` structure will be identical — only the module path changes.

2. **Dart Sass**: Does the new theme require Dart Sass? Blowfish does not — it ships plain CSS. If a custom theme using SCSS is desired later, `DART_SASS_VERSION` can be added then.

3. **Preview deployments**: Cloudflare Pages auto-deploys all branches as preview URLs. This is useful for testing but should be confirmed as desired behavior (it's the default and free).
