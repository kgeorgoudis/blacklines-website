## Context

The Blacklines portfolio uses Blowfish as the Hugo theme. Currently, the three main sections (DIY, Sketchnotes, DevOps) are displayed as plain text links on the homepage and in the navigation menu. Blowfish supports front matter icons and image assets, and can render them in navigation and content areas via configuration and custom partials.

## Goals / Non-Goals

**Goals:**
- Add visually distinct icons for each category (DIY, Sketchnotes, DevOps)
- Display icons on the homepage section cards to improve scannability
- Ensure icons render consistently across homepage and section list pages
- Use a simple, maintainable icon approach (emoji or bundled SVGs)

**Non-Goals:**
- Creating custom theme layouts (use Blowfish defaults + minimal overrides)
- Animating icons or adding JavaScript interactions
- Supporting multiple icon styles or themes
- Adding icons to individual posts

## Decisions

### Decision 1: Icon Format — Unicode Emoji

Use Unicode emoji rather than custom SVGs or Font Awesome for simplicity and no-dependency approach.

**Chosen:** Emoji icons (🛠️ for DIY, 📐 for Sketchnotes, ⚙️ for DevOps)

**Rationale:**
- No additional asset files or font dependencies
- Render consistently across browsers
- Easy to customize in front matter
- Blowfish renders emoji natively

**Alternatives considered:**
- Custom SVG files — adds file management complexity, slower to update
- Font Awesome — adds external dependency, larger CSS payload
- Images from `/static/` — file management, slower to load

### Decision 2: Icon Storage — Front Matter

Store icons as front matter fields in section `_index.md` files, not in `hugo.toml` menu config.

**Chosen:** Add `icon` field to each section's `_index.md` front matter

**Rationale:**
- Section-level icons belong with section content, not global config
- Easier to maintain (icon + section content colocated)
- Blowfish partials can read `.Params.icon` from page context

**Alternatives considered:**
- `hugo.toml` menu config — icons would need custom menu rendering
- Data files (`data/categories.yml`) — adds indirection, less intuitive

### Decision 3: Display Method — Homepage Partial Override

Create a minimal `layouts/partials/` override to render icons on the homepage alongside section cards.

**Chosen:** Create `layouts/partials/home-sections.html` that reads `icon` from page params

**Rationale:**
- Blowfish's home layout doesn't natively display section icons
- A single partial override is lightweight and maintainable
- Does not fork the entire theme

## Risks / Trade-offs

- **Emoji rendering:** Some platforms may render emoji slightly differently. Mitigation: Test on multiple devices/browsers; emojis are widely supported.
- **Icon discoverability:** Users may not intuitively understand icon meanings without labels. Mitigation: Keep text labels alongside icons.
- **Future changes:** If icon set needs updating, multiple section files must be edited. Mitigation: Document icon choices in this design.

## Implementation Approach

1. Add `icon:` front matter field to `content/diy/_index.md`, `content/sketchnotes/_index.md`, `content/devops/_index.md`
2. Create `layouts/partials/home-sections.html` override that renders section cards with icons
3. Integrate the partial into the homepage via `content/_index.md` or Blowfish's `index.html` layout
4. Verify icons display on homepage and section list pages

## Open Questions

1. **Icon styling:** Should icons be scaled larger on the homepage for visual impact? (e.g., CSS font-size increase)
2. **Icon alignment:** Should icons appear before section title, after, or as a standalone element?
3. **Menu icons:** Should the main menu links also display icons, or only on the homepage?
