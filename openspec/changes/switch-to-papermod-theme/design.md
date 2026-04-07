## Context

The site currently runs on the Blowfish theme loaded as a Hugo module (`go.mod` / `go.sum`). Blowfish brings Tailwind CSS, a complex asset pipeline, and several deprecated Hugo API usages that cannot be silenced without patching the module cache. PaperMod is a widely-used minimal Hugo theme distributed as a git submodule — no module system, no build pipeline, no external JS/CSS dependencies beyond Hugo's built-in asset processing.

Current custom files that are Blowfish-specific and must be removed:
- `layouts/partials/home-sections.html` — Blowfish card layout
- `layouts/partials/home/` — empty Blowfish extension directory
- `layouts/partials/extend-footer.html` — Blowfish footer hook
- `layouts/partials/social-links.html` — Blowfish Tailwind social icons
- `layouts/shortcodes/{github,gitea,forgejo,codeberg}.html` — patched Blowfish shortcodes

The deploy workflow (`deploy.yml`) already has `submodules: recursive` on the build job checkout, so PaperMod as a submodule will work without changes there.

## Goals / Non-Goals

**Goals:**
- Replace Blowfish with PaperMod, zero deprecation warnings
- Preserve the homepage welcome text and profile photo
- Keep the three sections (DIY, Sketchnotes, DevOps) navigable via the menu
- Keep social links (LinkedIn, Instagram, Substack, email)
- Keep `markup.goldmark.renderer.unsafe = true` for the inline `<img>` in `_index.md`

**Non-Goals:**
- Recreating the Blowfish section card grid on the homepage (PaperMod uses a different homepage model)
- Custom CSS/JS beyond what PaperMod provides out of the box
- Migrating Blowfish shortcode usage (none are used in content)
- Changing the deployment target or CI/CD logic

## Decisions

**PaperMod as git submodule, not Hugo module**
PaperMod's official installation method is git submodule (`themes/PaperMod/`). This is simpler than Hugo modules for a single-theme site: no `go.mod`, no module proxy, no cache invalidation issues. The existing `submodules: recursive` in the CI checkout already handles it.

**Use PaperMod's `homeInfoParams` for the homepage (not `profileMode`)**
PaperMod offers two homepage layouts: `profileMode` (centered avatar + bio) and the default layout with `homeInfoParams` (a text block + recent posts). Since the site has no "recent posts" feed and the welcome text is the main content, `homeInfoParams` with `title` and `content` fields maps cleanly to the current two paragraphs. The profile photo will be added via the `<img>` HTML already in `_index.md` (kept as-is since unsafe HTML stays enabled).

**Keep `content/_index.md` structure, update front matter only**
The body text and inline `<img>` block need no changes. Only the front matter changes: remove `layout: "hero"` (Blowfish-specific), add `layout: "home"` if needed, or just rely on PaperMod's default index template.

**Delete `go.mod` / `go.sum` entirely**
Once Blowfish is removed and PaperMod is a submodule, the Hugo module system is not needed. Keeping `go.mod` would cause Hugo to attempt module resolution on every build.

**`hugo.toml` rewrite, not incremental edit**
The Blowfish param namespace (`[params.homepage]`, `colorScheme`, etc.) has no equivalent in PaperMod. A clean rewrite avoids stale keys that silently do nothing.

## Risks / Trade-offs

- [Section cards gone] The Blowfish homepage showed three cards for DIY / Sketchnotes / DevOps. PaperMod's homepage doesn't have this. → Mitigation: the three sections remain reachable via the top menu; adding a card grid is possible later with a custom partial.
- [Tailwind classes in social-links.html deleted] The existing social links partial uses Tailwind classes (`flex`, `w-5`, etc.) that won't exist in PaperMod. → Mitigation: PaperMod has built-in social icon support via `params.socialIcons`; configure those instead.
- [Front matter keys] Some posts use `featured_image` and `images` (Blowfish conventions). PaperMod uses `cover.image`. → Mitigation: PaperMod degrades gracefully when those keys are absent; update post front matter incrementally as a follow-up.
- [peaceiris/actions-hugo@v2 in CI] This action is old and may produce its own warnings. → Out of scope for this change.

## Migration Plan

1. Add PaperMod submodule
2. Rewrite `hugo.toml`
3. Remove `go.mod`, `go.sum`, `_vendor/` (if present)
4. Delete Blowfish-specific layout files
5. Update `content/_index.md` front matter
6. Run `hugo server` locally and verify
7. Push — CI build job already has `submodules: recursive`
