## Why

The homepage and navigation currently display section names as plain text, which lacks visual distinction and makes it harder for visitors to quickly identify and navigate between the three main portfolio areas. Adding category-specific icons improves UX, visual hierarchy, and scannability. Additionally, "DevOps Posts" should be shortened to "DevOps" for conciseness in the menu.

## What Changes

- Add category icons (SVG or emoji) for DIY & Woodworking, Sketchnotes & Urban Sketches, and DevOps sections
- Display icons on the homepage card section and in section list headers
- Rename menu item label from "DevOps Posts" to "DevOps"
- Update section list page titles if needed for consistency

## Capabilities

### New Capabilities
- `category-icons`: Add visual icons for each portfolio category (DIY, Sketchnotes, DevOps), displayed on homepage cards and section headers for improved visual navigation

### Modified Capabilities
- None (this is a UX enhancement, not a behavior change)

## Impact

- `hugo.toml`: May add icon paths/configuration to menu items if using icon support
- `content/_index.md`: Update homepage content to reference or describe icons
- `content/diy/_index.md`, `content/sketchnotes/_index.md`, `content/devops/_index.md`: Add or update section titles and icon references
- Menu configuration: Update "DevOps Posts" label to "DevOps" (already done in current config, no change needed)
- Blowfish theme's menu partial may render icons if configured properly
