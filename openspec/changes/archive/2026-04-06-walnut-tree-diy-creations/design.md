## Context

The site is a Hugo static site hosted on Cloudflare Pages using the Blowfish theme. The DIY section already has one article (`rustic-bookshelf.md`) which establishes the content pattern. We have 12 raw photos in `three walnut artifacts/` with uppercase `.JPG`/`.jpeg` extensions and spaces/special characters in filenames that need to be normalized before use.

## Goals / Non-Goals

**Goals:**
- Publish a single new DIY article about the walnut table and two rooftop lights
- Normalize and copy all 12 photos into the Hugo static directory
- Match the existing DIY article structure so the section looks consistent

**Non-Goals:**
- Creating a dedicated gallery shortcode or new theme component
- Resizing or compressing images (out of scope; handled at deployment/CDN level)
- Adding any new Hugo taxonomy or section configuration

## Decisions

### 1. Single article file, not a page bundle
The existing DIY article (`rustic-bookshelf.md`) is a flat content file with image paths pointing to `static/images/`. Follow the same convention rather than introducing a Hugo page bundle, which would require moving existing content and changing image reference patterns.

**Alternative considered:** Hugo leaf bundle (`content/diy/walnut-tree-creations/index.md` + co-located images). Rejected because the existing content uses flat files and introducing bundles would be inconsistent without a broader migration.

### 2. Photo filename normalization
Source filenames contain uppercase extensions and spaces (e.g., `IMG_2545 (1).JPG`). These must be renamed to lowercase with no spaces before copying to `static/`:
- Pattern: `img_<number>.jpg` (lowercase, underscores, sequential where duplicates exist)
- Example: `IMG_2545 (1).JPG` → `img_2545_1.jpg`

**Why:** Avoid URL encoding issues and case-sensitivity problems on Linux-based Cloudflare Pages servers.

### 3. Photo organization — all in one directory
Place all 12 photos under `static/images/diy/walnut-creations/`. Within the article, group them into two gallery sections by subject (table vs. lights) using Markdown image syntax.

**Why:** Keeps the static directory structure consistent with `rustic-bookshelf` which uses `static/images/diy/`. No sub-grouping needed since the article prose provides the narrative context.

### 4. Article title
**"From Village Tree to Home: A Walnut Table and Two Rooftop Lights"**

This title captures the origin story (village tree) and clearly names all three creations.

## Risks / Trade-offs

- **Photo-to-section mapping is unknown** → Without EXIF data or labels, it's unclear which photos show the table vs. the lights. Mitigation: place all photos in a single gallery at the end of the article rather than attempting per-section assignment; the author can reorder after review.
- **Filename collisions** → `IMG_2545.JPG` and `IMG_2545 (1).JPG` both normalize to a similar name. Mitigation: rename the duplicate as `img_2545_1.jpg`.
- **Image display depends on theme** → Blowfish's image rendering is used as-is; no custom shortcodes or lightbox assumed. Trade-off: simpler implementation, but no fullscreen gallery UI.
