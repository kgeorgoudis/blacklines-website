## Why

The current Blowfish theme carries a persistent upstream deprecation warning (`.Site.Data`) that cannot be silenced without workarounds, and its Tailwind-based asset pipeline adds complexity to the build. PaperMod is a lighter, faster Hugo theme with a clean minimal aesthetic, built-in dark/light toggle, and no external CSS pipeline — making it easier to maintain long-term.

## What Changes

- **BREAKING** Remove Blowfish as a Hugo module dependency
- **BREAKING** Remove all Blowfish-specific custom layouts (`layouts/partials/`, `layouts/shortcodes/`)
- Add PaperMod as a git submodule under `themes/PaperMod/`
- Rewrite `hugo.toml` for PaperMod's configuration model (params, menus, social, homepage)
- Rewrite `content/_index.md` to use PaperMod's `homeInfoParams` for the welcome section (profile photo + bio)
- Remove `go.mod` / `go.sum` (no longer needed — PaperMod is a submodule, not a Hugo module)
- Update `markup.goldmark.renderer.unsafe = true` — keep it (still needed for the inline `<img>` in `_index.md`)
- Update GitHub Actions workflow: remove `hugo mod` step if present, ensure submodule checkout is set (`submodules: recursive`)

## Capabilities

### New Capabilities
- `papermod-site-config`: PaperMod-compatible `hugo.toml` — theme reference, params, menu, social icons, homepage layout
- `papermod-homepage`: Homepage content and profile configuration using PaperMod's `homeInfoParams` or `profileMode`, preserving the photo, name, birth year, location, and welcome paragraphs

### Modified Capabilities
- `cloudflare-pages-deployment`: The deploy workflow references `submodules: recursive` in `actions/checkout` — this is already set, but must be confirmed after removing `go.mod`

## Impact

- `hugo.toml` — full rewrite
- `content/_index.md` — front matter changes for PaperMod homepage layout
- `layouts/` — all custom partials and shortcodes removed (Blowfish-specific)
- `go.mod`, `go.sum` — deleted
- `_vendor/` — deleted (if present)
- `.github/workflows/deploy.yml` — verify submodule checkout, remove any `hugo mod` steps
- `static/images/profile.jpeg` — unchanged, still used
