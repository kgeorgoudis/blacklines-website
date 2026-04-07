## ADDED Requirements

### Requirement: PaperMod is installed as a git submodule
The PaperMod theme SHALL be added as a git submodule at `themes/PaperMod/` pointing to the official repository. No Hugo module system (`go.mod`, `go.sum`) SHALL be present in the project root.

#### Scenario: Submodule present after clone
- **WHEN** the repository is cloned with `--recurse-submodules`
- **THEN** `themes/PaperMod/` SHALL exist and contain the PaperMod theme files

#### Scenario: No go.mod in project root
- **WHEN** the project root is inspected
- **THEN** `go.mod` and `go.sum` SHALL NOT be present

### Requirement: hugo.toml references PaperMod as the active theme
The `hugo.toml` configuration SHALL set `theme = "PaperMod"` and SHALL NOT reference any Blowfish configuration keys (`colorScheme`, `defaultAppearance` via Blowfish params, `[params.homepage].layout`, etc.).

#### Scenario: Hugo builds with PaperMod
- **WHEN** `hugo` is run in the project root
- **THEN** the build SHALL succeed using PaperMod templates with no "theme not found" errors

#### Scenario: No Blowfish-specific params remain
- **WHEN** `hugo.toml` is inspected
- **THEN** it SHALL NOT contain `colorScheme`, `[params.homepage]`, or `[module.imports]` pointing to Blowfish

### Requirement: Social links are configured via PaperMod's socialIcons param
The site SHALL configure social links (LinkedIn, Instagram, Substack, email) using PaperMod's `[[params.socialIcons]]` array, not via a custom Blowfish partial.

#### Scenario: Social icons rendered on site
- **WHEN** the homepage is rendered
- **THEN** links to LinkedIn, Instagram, Substack, and email SHALL appear using PaperMod's built-in social icon rendering

### Requirement: Site menu has three entries (DIY, Sketchnotes, DevOps)
The `hugo.toml` SHALL define three `[[menu.main]]` entries for DIY (`/diy/`), Sketchnotes (`/sketchnotes/`), and DevOps (`/devops/`) in that order.

#### Scenario: Navigation menu renders correctly
- **WHEN** any page on the site is rendered
- **THEN** the top navigation SHALL display DIY, Sketchnotes, and DevOps links in order

### Requirement: No Blowfish-specific layout files remain
All Blowfish-specific files in `layouts/` SHALL be removed: `partials/home-sections.html`, `partials/home/`, `partials/extend-footer.html`, `partials/social-links.html`, and `shortcodes/{github,gitea,forgejo,codeberg}.html`.

#### Scenario: layouts/ contains no Blowfish files
- **WHEN** the `layouts/` directory is inspected
- **THEN** none of the above Blowfish-specific files SHALL be present
