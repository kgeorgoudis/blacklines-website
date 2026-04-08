## Why

The sketchnotes section currently holds a single placeholder article with long text. The actual content — 13 hand-drawn images across two distinct styles — needs a proper gallery that lets visitors browse by category and view images comfortably without leaving the page.

## What Changes

- Move all 13 images from `import/sketch/` to `static/images/sketchnotes/`
- Replace the existing `coffee-shop-sketch.md` placeholder with 13 individual content files, one per image, each with a title, short description, and category
- Create a custom `layouts/sketchnotes/list.html` that renders a two-section image grid (Sketchnotes / Urban Sketches) instead of PaperMod's default post list
- Add GLightbox (lightweight JS lightbox, ~11KB) for click-to-enlarge with prev/next carousel navigation within each category
- Delete the old placeholder `coffee-shop-sketch.md`

## Capabilities

### New Capabilities
- `sketchnotes-image-gallery`: A category-separated image gallery in the sketchnotes section — custom list layout, two labeled sections, GLightbox lightbox with carousel navigation, one content file per sketch

### Modified Capabilities
<!-- No existing specs cover the sketchnotes section layout -->

## Impact

- `content/sketchnotes/` — 13 new content files added, 1 placeholder removed
- `static/images/sketchnotes/` — 13 images copied from `import/sketch/`
- `layouts/sketchnotes/list.html` — new custom list template (overrides PaperMod's section list for this section only)
- `static/js/glightbox.min.js` and `static/css/glightbox.min.css` — GLightbox assets added
- `layouts/partials/extend_head.html` — new partial to inject GLightbox CSS/JS on sketchnotes pages
