## ADDED Requirements

### Requirement: Site uses Blowfish as the Hugo theme via Hugo Modules
The site SHALL use the Blowfish theme, installed as a Hugo Module dependency declared in `go.mod`, with no theme files committed to the `themes/` directory.

#### Scenario: Theme is resolved from go.mod at build time
- **WHEN** Hugo builds the site
- **THEN** it SHALL resolve the Blowfish theme from the module path declared in `go.mod`
- **AND** no `themes/` directory SHALL need to exist in the repository

#### Scenario: Old minimal theme is removed
- **WHEN** the repository is cloned after migration
- **THEN** the `themes/minimal/` directory SHALL NOT exist
- **AND** `hugo.toml` SHALL reference `blowfish` as the theme (or equivalent Hugo Modules config)

### Requirement: Theme supports automatic dark/light mode switching
The site SHALL render in dark or light mode based on the visitor's system preference, with no manual toggle required.

#### Scenario: Dark mode activates on system dark preference
- **WHEN** a visitor's OS is set to dark mode
- **THEN** the site SHALL render with a dark color scheme automatically

#### Scenario: Light mode activates on system light preference
- **WHEN** a visitor's OS is set to light mode
- **THEN** the site SHALL render with a light color scheme automatically

### Requirement: All three content sections are navigable from the main menu
The site SHALL display navigation links for DIY, Sketchnotes, and DevOps sections, matching the existing `hugo.toml` menu configuration.

#### Scenario: Menu renders all three sections
- **WHEN** a visitor views any page on the site
- **THEN** the navigation menu SHALL display links to DIY, Sketchnotes, and DevOps

#### Scenario: Section list pages render correctly
- **WHEN** a visitor navigates to `/diy/`, `/sketchnotes/`, or `/devops/`
- **THEN** Hugo SHALL render a list of posts in that section using the theme's list layout

### Requirement: Existing content front matter is compatible with the new theme
All existing content files SHALL render correctly with the Blowfish theme without requiring changes to standard Hugo front matter fields (`title`, `date`, `draft`, `tags`, `categories`).

#### Scenario: Posts render without front matter errors
- **WHEN** Hugo builds the site with existing content
- **THEN** no template or front matter errors SHALL occur for any content file
- **AND** all published (non-draft) posts SHALL appear in their respective section list pages

#### Scenario: Theme defaults apply when optional fields are absent
- **WHEN** a content file does not include Blowfish-specific front matter (e.g., `showToc`, `heroStyle`)
- **THEN** the theme's default parameter values from `hugo.toml` SHALL apply
- **AND** the post SHALL render without errors or missing layout warnings

### Requirement: Site passes Hugo build with no errors or warnings
After theme integration, the Hugo build SHALL complete with zero errors and zero warnings in the build output.

#### Scenario: Clean build output
- **WHEN** `hugo --minify` is run locally or on Cloudflare Pages
- **THEN** the command SHALL exit with status code 0
- **AND** the build log SHALL contain no ERROR or WARN lines
