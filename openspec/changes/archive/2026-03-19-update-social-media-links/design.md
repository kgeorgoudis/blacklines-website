## Context

The website is a Hugo-based portfolio using the Blowfish theme. Currently, there are no social media links displayed. The site uses `hugo.toml` for configuration and layouts from the vendored Blowfish theme. Adding social links requires configuration and custom partial templates since the theme doesn't have built-in social link support in the current configuration.

## Goals / Non-Goals

**Goals:**
- Store social media URLs in a single configuration location (`hugo.toml`) for easy maintenance
- Display social links with icons in the footer (visible on all pages)
- Optionally display social links on the homepage for quick visibility
- Ensure links are accessible and mobile-friendly
- Use semantic HTML with proper accessibility labels

**Non-Goals:**
- Custom icon library installation (use Font Awesome via CDN or Unicode symbols)
- Social media sharing buttons for individual posts
- Analytics tracking on link clicks
- Theme modifications to Blowfish (use custom partials in `layouts/` instead)

## Decisions

### Decision 1: Store social links in `hugo.toml` under `[params.social]`
**Rationale:** Hugo's `params` section is the standard location for site-wide configuration. This keeps all social URLs in one place and makes updates easy without code changes.

**Alternative:** Use a separate data file (`data/social.yml`) — rejected because `params` is more discoverable and commonly used in Hugo.

**Structure:**
```toml
[params.social]
  linkedin = "https://www.linkedin.com/in/kgeor/"
  instagram = "https://www.instagram.com/k.georgoudis/"
  substack = "https://kgeor.substack.com/"
  email = "kgeor@blacklines.gr"
```

### Decision 2: Create a custom partial template `layouts/partials/social-links.html`
**Rationale:** Blowfish doesn't include a built-in social links partial. Creating a custom partial allows us to render social links consistently and reuse it in multiple locations (footer, homepage, etc.).

**Structure:** A simple template that iterates over configured social links and renders them as a list with icons.

### Decision 3: Integrate social links into the footer via custom footer partial
**Rationale:** The footer is visible on every page and is the standard location for social links. This requires creating or modifying the footer partial in `layouts/partials/footer.html` to include social links.

**Alternative:** Modify the theme's footer directly — rejected because vendoring the theme makes custom modifications fragile and harder to maintain.

### Decision 4: Use Unicode/Font Awesome icons for social platforms
**Rationale:** Avoid adding dependencies; use Unicode symbols (e.g., 🔗 for email, 💼 for LinkedIn) or Font Awesome CSS (loaded via CDN in Blowfish). This keeps the site lightweight.

**Alternative:** Custom SVG icons — rejected due to maintenance overhead; symbols/Font Awesome are simpler.

## Risks / Trade-offs

**Risk:** Footer partial may not exist in current layouts
→ **Mitigation:** Check if Blowfish provides a footer partial or extend the base layout appropriately.

**Risk:** Custom partials in `layouts/` could conflict with theme updates
→ **Mitigation:** Use specific partial names that won't collide; keep customizations minimal. If Blowfish updates, we can update our partials independently.

**Risk:** Email link (`mailto:`) may not work as expected on some devices
→ **Mitigation:** Email link is standard HTML; all modern browsers and devices support it. Provide fallback (display email text alongside link).

**Trade-off:** Using Font Awesome requires loading CSS from CDN
→ **Mitigation:** Blowfish likely already loads Font Awesome for other features; verify in theme's base layout. If not, add minimal CSS load.

## Migration Plan

1. Update `hugo.toml` to add `[params.social]` section with social media URLs
2. Create `layouts/partials/social-links.html` to render social links
3. Create or modify `layouts/partials/footer.html` to include the social links partial
4. Test locally: `hugo server` and verify links appear in footer
5. Verify responsive design on mobile devices
6. Verify accessibility (alt text, aria labels on icons)
7. Deploy via Cloudflare Pages (existing CI/CD)

## Open Questions

- Should social links appear on the homepage as well as footer, or footer only?
- Does the Blowfish theme already provide a footer partial that we can extend?
- Should we use Font Awesome, Unicode symbols, or text labels for social icons?
