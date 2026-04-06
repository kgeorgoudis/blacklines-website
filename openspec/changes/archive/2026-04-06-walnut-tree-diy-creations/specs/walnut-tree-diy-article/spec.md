## ADDED Requirements

### Requirement: Article exists as a Hugo content page under DIY
The site SHALL have a new article at `content/diy/walnut-tree-creations.md` with valid Hugo frontmatter including title, date, description, tags, categories, and image references.

#### Scenario: Article is accessible under the DIY section
- **WHEN** a visitor navigates to the DIY section
- **THEN** the walnut creations article SHALL appear in the listing

#### Scenario: Article frontmatter is complete
- **WHEN** Hugo builds the site
- **THEN** the article SHALL render without errors and include a title, date, description, tags `["woodworking", "walnut", "lighting", "furniture"]`, and category `["DIY"]`

### Requirement: Article tells the story of the three walnut creations
The article SHALL open with a personal narrative explaining that the walnut came from a tree cut down in the author's village yard, and that three pieces were used to create a table and two rooftop pendant lights.

#### Scenario: Story context is present
- **WHEN** a reader opens the article
- **THEN** they SHALL find an introduction that mentions the village tree origin of the wood

#### Scenario: All three creations are covered
- **WHEN** a reader reads the article
- **THEN** there SHALL be a dedicated section for the table and a dedicated section for the two rooftop lights

### Requirement: All 12 photos are embedded in the article
The article SHALL include all 12 photos from the source directory, organized into gallery sections that correspond to the relevant creation (table or lights).

#### Scenario: Photos are referenced from the correct static path
- **WHEN** Hugo builds the article
- **THEN** each image tag SHALL reference a path under `/images/diy/walnut-creations/`

#### Scenario: Photos are copied to the static directory
- **WHEN** the change is applied
- **THEN** all 12 source photos from `three walnut artifacts/` SHALL exist at `static/images/diy/walnut-creations/` with sanitized filenames (lowercase, no spaces)

### Requirement: Article follows the established DIY content format
The article structure SHALL mirror the format of `content/diy/rustic-bookshelf.md`, including sections for Project Overview, Materials Used, and the creation process.

#### Scenario: Article structure matches existing DIY content
- **WHEN** the article is compared to existing DIY articles
- **THEN** it SHALL use the same frontmatter keys and section heading conventions
