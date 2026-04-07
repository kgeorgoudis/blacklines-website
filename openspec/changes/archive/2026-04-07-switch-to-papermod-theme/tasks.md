## 1. Add PaperMod Theme

- [x] 1.1 Run `git submodule add --depth=1 https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod` to add PaperMod as a submodule
- [x] 1.2 Verify `themes/PaperMod/` exists and contains theme files

## 2. Remove Blowfish Dependencies

- [x] 2.1 Delete `go.mod` from the project root
- [x] 2.2 Delete `go.sum` from the project root
- [x] 2.3 Delete `_vendor/` directory if present
- [x] 2.4 Remove the `[module]` / `[[module.imports]]` block from `hugo.toml`

## 3. Remove Blowfish Layout Files

- [x] 3.1 Delete `layouts/partials/home-sections.html`
- [x] 3.2 Delete `layouts/partials/home/` directory
- [x] 3.3 Delete `layouts/partials/extend-footer.html`
- [x] 3.4 Delete `layouts/partials/social-links.html`
- [x] 3.5 Delete `layouts/shortcodes/github.html`, `gitea.html`, `forgejo.html`, `codeberg.html`

## 4. Rewrite hugo.toml

- [x] 4.1 Set `theme = "PaperMod"` (replacing the module import)
- [x] 4.2 Set `[params] defaultTheme = "auto"` for light/dark toggle following OS preference
- [x] 4.3 Add `[params.homeInfoParams]` with `Title` and `Content` matching the current welcome text
- [x] 4.4 Add `[[params.socialIcons]]` entries for LinkedIn, Instagram, Substack, and email
- [x] 4.5 Keep the three `[[menu.main]]` entries (DIY, Sketchnotes, DevOps) unchanged
- [x] 4.6 Keep `[markup.goldmark.renderer] unsafe = true`
- [x] 4.7 Remove all Blowfish-specific params (`colorScheme`, `showToc`, `showReadingTime`, `showWordCount`, `showBreadcrumbs`, `showDate`, `showAuthor`, `groupByYear`, `[params.homepage]`)

## 5. Update Homepage Front Matter

- [x] 5.1 In `content/_index.md`, remove `layout: "hero"` from front matter
- [x] 5.2 Verify the inline `<img>` profile block and welcome paragraphs remain untouched in the body

## 6. Verify Build

- [ ] 6.1 Run `hugo server` locally and confirm the homepage renders with welcome text and profile photo
- [ ] 6.2 Confirm navigation menu shows DIY, Sketchnotes, DevOps
- [ ] 6.3 Confirm social icons render (LinkedIn, Instagram, Substack, email)
- [x] 6.4 Confirm `hugo` produces no WARN or ERROR output
- [ ] 6.5 Confirm the three section pages (`/diy/`, `/sketchnotes/`, `/devops/`) are accessible
