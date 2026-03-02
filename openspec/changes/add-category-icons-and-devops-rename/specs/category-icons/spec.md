## ADDED Requirements

### Requirement: Each category displays a distinct emoji icon
Each portfolio category (DIY, Sketchnotes, DevOps) SHALL have an associated emoji icon that is displayed on the homepage and section list pages to improve visual navigation and scannability.

#### Scenario: DIY category displays toolbox icon
- **WHEN** a visitor views the homepage or DIY section list
- **THEN** the DIY category header or card SHALL display the 🛠️ (toolbox) emoji icon
- **AND** the icon SHALL appear before or above the category title

#### Scenario: Sketchnotes category displays ruler icon
- **WHEN** a visitor views the homepage or Sketchnotes section list
- **THEN** the Sketchnotes category header or card SHALL display the 📐 (ruler/drafting) emoji icon
- **AND** the icon SHALL appear before or above the category title

#### Scenario: DevOps category displays gear icon
- **WHEN** a visitor views the homepage or DevOps section list
- **THEN** the DevOps category header or card SHALL display the ⚙️ (gear) emoji icon
- **AND** the icon SHALL appear before or above the category title

### Requirement: Icons are scalable and styled
Icons SHALL be rendered in a way that allows CSS styling for size, spacing, and alignment without modifying the emoji itself.

#### Scenario: Icons scale on homepage
- **WHEN** icons are displayed on the homepage category cards
- **THEN** they SHALL be larger than inline text (e.g., 2-3rem font size) for visual prominence
- **AND** they SHALL align consistently with section titles

#### Scenario: Icons are readable on all screen sizes
- **WHEN** a visitor accesses the site on mobile, tablet, or desktop
- **THEN** icons SHALL remain visible and properly sized
- **AND** text labels SHALL accompany icons to ensure accessibility

### Requirement: Icon configuration is maintainable
Icon-to-category mappings SHALL be stored in section front matter, making them easy to update without touching theme code.

#### Scenario: Icon is configurable per section
- **WHEN** an editor updates `content/diy/_index.md` with `icon: 🛠️`
- **THEN** that icon SHALL be used for the DIY category on all pages
- **AND** changing the front matter SHALL immediately update the displayed icon on rebuild

### Requirement: Icons integrate with homepage display
The homepage layout SHALL render category icons alongside section titles and descriptions.

#### Scenario: Homepage shows all three category icons
- **WHEN** a visitor loads the homepage
- **THEN** the three category sections (DIY, Sketchnotes, DevOps) SHALL each display their respective emoji icons
- **AND** the icons SHALL be visually distinct and aligned

### Requirement: Menu displays DevOps label (renamed)
The main navigation menu SHALL display "DevOps" instead of "DevOps Posts" for brevity.

#### Scenario: Menu item shows DevOps label
- **WHEN** a visitor views the navigation menu
- **THEN** the menu item for the DevOps section SHALL read "DevOps"
- **AND** it SHALL link to `/devops/` as expected
