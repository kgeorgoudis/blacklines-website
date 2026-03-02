## 1. Add Icons to Section Front Matter

- [x] 1.1 Add `icon: 🛠️` to `content/diy/_index.md` front matter
- [x] 1.2 Add `icon: 📐` to `content/sketchnotes/_index.md` front matter
- [x] 1.3 Add `icon: ⚙️` to `content/devops/_index.md` front matter
- [x] 1.4 Verify each section file parses correctly (no YAML errors)

## 2. Create Homepage Partial Override

- [x] 2.1 Create `layouts/partials/` directory if it doesn't exist
- [x] 2.2 Create `layouts/partials/home-sections.html` partial that renders DIY, Sketchnotes, and DevOps section cards with icons
- [x] 2.3 In the partial, read `.Params.icon` from each section's page context and display it before the section title
- [x] 2.4 Style icons with CSS (font-size: 2.5rem or larger for prominence, proper spacing/margin)

## 3. Integrate Partial into Homepage

- [x] 3.1 Update `content/_index.md` to call the `home-sections` partial (using `{{ partial "home-sections.html" . }}` shortcode or via Blowfish's built-in hook)
- [x] 3.2 Alternatively, override `layouts/index.html` to integrate the partial if Blowfish's default home layout doesn't provide a suitable hook
- [x] 3.3 Verify the homepage renders with icons visible and styled

## 4. Verify Menu Label (DevOps)

- [x] 4.1 Confirm `hugo.toml` already has `name = 'DevOps'` in the menu.main entry (not "DevOps Posts")
- [x] 4.2 If needed, update the menu entry label from "DevOps Posts" to "DevOps"

## 5. Local Testing

- [x] 5.1 Run `hugo server` and visually verify icons display on homepage
- [x] 5.2 Check homepage cards show DIY (🛠️), Sketchnotes (📐), DevOps (⚙️) icons with text labels
- [x] 5.3 Verify icons are properly sized and aligned (not too small, not overlapping text)
- [x] 5.4 Check section list pages (e.g., `/diy/`, `/sketchnotes/`, `/devops/`) render correctly
- [x] 5.5 Test on at least one mobile viewport size to ensure icons are readable
- [x] 5.6 Run `hugo --minify` and confirm zero build errors

## 6. Commit and Deploy

- [x] 6.1 Commit all changes (`content/*/\_index.md`, `layouts/partials/`, `hugo.toml` if updated) with a descriptive message
- [x] 6.2 Push to GitHub to trigger Cloudflare Pages redeploy
- [x] 6.3 Verify live site at `https://www.blacklines.gr/` displays icons correctly
