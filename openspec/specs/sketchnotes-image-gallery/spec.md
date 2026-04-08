# Spec: Sketchnotes Image Gallery

## Purpose
Defines how the `/sketchnotes/` section renders as a two-category image gallery with lightbox support, replacing PaperMod's default article list.

## Requirements

### Requirement: Sketchnotes section renders as a two-category image gallery
The `/sketchnotes/` section page SHALL render as an image gallery with two clearly labelled category sections — "Sketchnotes" and "Urban Sketches" — instead of PaperMod's default article list. Each category section SHALL display all images belonging to it in a responsive grid.

#### Scenario: Section page shows two category headings
- **WHEN** a visitor navigates to `/sketchnotes/`
- **THEN** the page SHALL display a "Sketchnotes" section heading and an "Urban Sketches" section heading, in that order

#### Scenario: Images grouped correctly under each heading
- **WHEN** the gallery renders
- **THEN** all content files with `categories: ["Sketchnotes"]` SHALL appear under the Sketchnotes heading
- **AND** all content files with `categories: ["Urban Sketches"]` SHALL appear under the Urban Sketches heading

### Requirement: Each gallery item displays a thumbnail and caption
Each sketch SHALL be represented by an image thumbnail and a short text caption (title + one-line description) visible without interaction.

#### Scenario: Thumbnail and caption visible in grid
- **WHEN** the gallery page is rendered
- **THEN** each item SHALL show the sketch image as a thumbnail
- **AND** the item's `title` and `description` front matter SHALL be visible beneath the image

#### Scenario: Grid adapts to screen width
- **WHEN** the page is viewed on a narrow viewport (mobile)
- **THEN** the grid SHALL reduce to fewer columns without horizontal scrolling

### Requirement: Clicking a thumbnail opens a full-size lightbox with category carousel
Clicking any thumbnail SHALL open a full-size lightbox view of that image. The lightbox SHALL support navigating to the previous and next image within the same category using arrow controls or keyboard.

#### Scenario: Lightbox opens on thumbnail click
- **WHEN** a visitor clicks a thumbnail
- **THEN** a full-size lightbox SHALL open displaying that image

#### Scenario: Navigation stays within the same category
- **WHEN** the lightbox is open on a Sketchnotes image and the visitor clicks the next arrow
- **THEN** the next image shown SHALL also be from the Sketchnotes category, not from Urban Sketches

#### Scenario: Lightbox can be closed
- **WHEN** the lightbox is open
- **THEN** pressing Escape or clicking outside the image SHALL close the lightbox

### Requirement: All 13 sketch images are present and served
The site SHALL serve all 13 sketch images from `static/images/sketchnotes/` with descriptive, lowercase-hyphenated filenames.

#### Scenario: All images accessible at their URL
- **WHEN** a build is run
- **THEN** all 13 image files SHALL exist under `public/images/sketchnotes/` in the built output

### Requirement: Each sketch has a corresponding Hugo content file
The `content/sketchnotes/` directory SHALL contain exactly 13 content files (one per image) with the following front matter fields: `title`, `description`, `date`, `draft: false`, `categories`, and `params.image`.

#### Scenario: Content files use correct category values
- **WHEN** content files are inspected
- **THEN** each file SHALL have `categories` set to exactly `["Sketchnotes"]` or `["Urban Sketches"]`
- **AND** no file SHALL have both categories

#### Scenario: No body text in content files
- **WHEN** content files are inspected
- **THEN** the markdown body below the front matter delimiter SHALL be empty

### Requirement: GLightbox assets are self-hosted with no external CDN dependency
The GLightbox JavaScript and CSS SHALL be served from the site's own `static/` directory, not loaded from an external CDN.

#### Scenario: GLightbox loads from local paths
- **WHEN** the page source is inspected
- **THEN** the GLightbox script and stylesheet tags SHALL reference `/js/glightbox.min.js` and `/css/glightbox.min.css` respectively

### Requirement: Old placeholder content is removed
The file `content/sketchnotes/coffee-shop-sketch.md` SHALL NOT exist in the final state.

#### Scenario: Placeholder article absent from gallery
- **WHEN** the gallery renders
- **THEN** "Coffee Shop Study Session" SHALL NOT appear in the gallery
