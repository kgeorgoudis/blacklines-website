## Context

The site runs on Hugo + PaperMod. PaperMod's default section list template renders articles as text cards (title, date, summary). For a photo gallery this is wrong — we need image thumbnails in a grid, grouped by category, with a lightbox for full-size viewing. PaperMod supports overriding any template by placing a matching file in the project's `layouts/` directory, so a custom `layouts/sketchnotes/list.html` will replace the default list for this section only.

The 13 images currently sit in `import/sketch/` (not served). They need to be in `static/images/sketchnotes/` to be accessible at build time.

Image inventory and categories:
- **Sketchnotes** (9): Google Cloud Fundamentals, The Stress Prescription, Spec-Driven Development, Benefits of SLOs, Made to Stick, APIs in Telecom, Hand Lettering Practice, APIs in Telecom Training, Tracing with Istio & Jaeger, What are Sketchnotes, Brain Parts
- **Urban Sketches** (4): Botanical Plants (Zanthoxylum & Acer Palmatum), Visual Vocabulary / Icon Sheet, Technical Skills bouquet

## Goals / Non-Goals

**Goals:**
- Two visually distinct category sections on one page
- Responsive image grid (thumbnails), short caption per image
- Click-to-enlarge with prev/next navigation within category (lightbox/carousel)
- No long article text per sketch — just title + one-line description
- Zero new npm/build dependencies — GLightbox loaded from `static/`

**Non-Goals:**
- Separate sub-section URLs per category (e.g. `/sketchnotes/urban-sketches/`)
- Full-page article view per sketch
- Search or filtering beyond the two fixed categories
- Server-side image resizing

## Decisions

**One page, two sections — not sub-sections**
Keeping everything on `/sketchnotes/` is simpler: one custom layout file, no extra `_index.md` files per sub-section, no menu changes. The two categories are visually separated by a heading and a visual divider. If more categories are added later, sub-sections can be introduced then.

**Each sketch = one Hugo content file (no body text)**
Front matter carries everything needed: `title`, `description` (one sentence), `categories` (for grouping), and `params.image` (path to the image). The body is empty. This keeps content structured and editable without touching the template.

**Custom `layouts/sketchnotes/list.html` — not a shortcode**
The list template is the right hook: it controls how the entire section renders. A shortcode would require editing `_index.md` body and is harder to maintain. The template iterates `.Pages`, groups by category, and renders the grid.

**GLightbox for lightbox/carousel**
GLightbox is 11KB minified, dependency-free, accessible, and supports grouping (so prev/next stays within one category). It is loaded via a `layouts/partials/extend_head.html` partial that PaperMod calls on every page — but the CSS/JS only activates when `.glightbox` elements exist, so it has zero impact on other pages.

**Images served from `static/images/sketchnotes/`**
Hugo copies `static/` as-is to `public/`. No image processing pipeline needed — the originals are already camera-resolution JPEGs; the CSS will constrain their display size as thumbnails.

**File naming: lowercase with hyphens**
Original filenames (`IMG_2082.jpeg`, `camphoto_...`) are renamed to descriptive slugs (`spec-driven-development.jpeg`, `google-cloud-fundamentals.jpg`) for readability and stable URLs.

## Risks / Trade-offs

- [Large image files] Original JPEGs are full camera resolution — page weight could be high → Mitigation: CSS `object-fit: cover` on fixed-size thumbnails means only the displayed area renders visually; full resolution only loads when the lightbox opens. Future: add Hugo image processing for thumbnails.
- [GLightbox grouping] GLightbox groups images by the `data-gallery` attribute — must set different group names per category so prev/next stays within the category → Handled in template.
- [PaperMod update] If PaperMod is updated via `git submodule update`, the custom list template remains (it's in project `layouts/`, not the theme) → No risk.

## Migration Plan

1. Copy images to `static/images/sketchnotes/` with descriptive names
2. Create 13 content files in `content/sketchnotes/`
3. Remove placeholder `coffee-shop-sketch.md`
4. Download GLightbox assets to `static/js/` and `static/css/`
5. Create `layouts/sketchnotes/list.html`
6. Create `layouts/partials/extend_head.html` to inject GLightbox
7. Build and verify locally
