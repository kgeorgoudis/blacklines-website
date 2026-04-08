## 1. Prepare Images

- [x] 1.1 Create directory `static/images/sketchnotes/`
- [x] 1.2 Copy `import/sketch/camphoto_1254324197.jpg` → `static/images/sketchnotes/google-cloud-fundamentals.jpg`
- [x] 1.3 Copy `import/sketch/IMG_0136.JPG` → `static/images/sketchnotes/botanical-plants.jpg`
- [x] 1.4 Copy `import/sketch/IMG_0324.jpeg` → `static/images/sketchnotes/stress-prescription.jpeg`
- [x] 1.5 Copy `import/sketch/IMG_2082.jpeg` → `static/images/sketchnotes/spec-driven-development.jpeg`
- [x] 1.6 Copy `import/sketch/IMG_2083.jpeg` → `static/images/sketchnotes/benefits-of-slos.jpeg`
- [x] 1.7 Copy `import/sketch/IMG_2084.jpeg` → `static/images/sketchnotes/made-to-stick.jpeg`
- [x] 1.8 Copy `import/sketch/IMG_2085.jpeg` → `static/images/sketchnotes/visual-vocabulary.jpeg`
- [x] 1.9 Copy `import/sketch/IMG_2086.jpeg` → `static/images/sketchnotes/hand-lettering.jpeg`
- [x] 1.10 Copy `import/sketch/IMG_2087.jpeg` → `static/images/sketchnotes/apis-in-telecom.jpeg`
- [x] 1.11 Copy `import/sketch/IMG_2088.jpeg` → `static/images/sketchnotes/technical-skills.jpeg`
- [x] 1.12 Copy `import/sketch/IMG_2089.jpeg` → `static/images/sketchnotes/tracing-istio-jaeger.jpeg`
- [x] 1.13 Copy `import/sketch/IMG_4757.jpeg` → `static/images/sketchnotes/what-are-sketchnotes.jpeg`
- [x] 1.14 Copy `import/sketch/IMG_4783.jpeg` → `static/images/sketchnotes/brain-parts.jpeg`

## 2. Add GLightbox Assets

- [x] 2.1 Download `glightbox.min.js` from the GLightbox GitHub release and save to `static/js/glightbox.min.js`
- [x] 2.2 Download `glightbox.min.css` from the GLightbox GitHub release and save to `static/css/glightbox.min.css`

## 3. Create Content Files

- [x] 3.1 Delete `content/sketchnotes/coffee-shop-sketch.md`
- [x] 3.2 Create `content/sketchnotes/google-cloud-fundamentals.md` (category: Sketchnotes)
- [x] 3.3 Create `content/sketchnotes/stress-prescription.md` (category: Sketchnotes)
- [x] 3.4 Create `content/sketchnotes/spec-driven-development.md` (category: Sketchnotes)
- [x] 3.5 Create `content/sketchnotes/benefits-of-slos.md` (category: Sketchnotes)
- [x] 3.6 Create `content/sketchnotes/made-to-stick.md` (category: Sketchnotes)
- [x] 3.7 Create `content/sketchnotes/apis-in-telecom.md` (category: Sketchnotes)
- [x] 3.8 Create `content/sketchnotes/tracing-istio-jaeger.md` (category: Sketchnotes)
- [x] 3.9 Create `content/sketchnotes/what-are-sketchnotes.md` (category: Sketchnotes)
- [x] 3.10 Create `content/sketchnotes/brain-parts.md` (category: Sketchnotes)
- [x] 3.11 Create `content/sketchnotes/botanical-plants.md` (category: Urban Sketches)
- [x] 3.12 Create `content/sketchnotes/visual-vocabulary.md` (category: Urban Sketches)
- [x] 3.13 Create `content/sketchnotes/hand-lettering.md` (category: Urban Sketches)
- [x] 3.14 Create `content/sketchnotes/technical-skills.md` (category: Urban Sketches)

## 4. Create Gallery Template

- [x] 4.1 Create `layouts/sketchnotes/list.html` — custom list template with two category sections, responsive CSS grid, and GLightbox `data-gallery` attributes
- [x] 4.2 Create `layouts/partials/extend_head.html` — inject GLightbox CSS and JS, and initialize GLightbox via inline `<script>`

## 5. Verify Build

- [x] 5.1 Run `hugo` and confirm zero warnings/errors
- [x] 5.2 Run `hugo server` and confirm the gallery page at `/sketchnotes/` shows two sections with all 13 images
- [x] 5.3 Click a thumbnail and confirm the lightbox opens with prev/next navigation within the category
