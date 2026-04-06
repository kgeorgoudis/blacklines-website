## Context

The site uses Hugo with the Blowfish theme ("fire" color scheme). The homepage is controlled by `content/_index.md` with `layout: hero`. A custom partial (`layouts/partials/home-sections.html`) renders the three section cards (DIY, Sketchnotes, DevOps) below the page content. The current body text is a single generic line.

## Goals / Non-Goals

**Goals:**
- Write friendly, honest welcome copy that introduces Konstantinos without feeling like a CV
- Touch on the thread connecting his work: hands-on curiosity from fixing TVs to building infrastructure to crafting furniture
- Point visitors toward the three site sections with a sense of what they'll find

**Non-Goals:**
- Redesigning the layout or changing the theme
- Adding a photo or avatar
- Adding new sections or pages
- Writing bio-length prose — it should be short and conversational

## Decisions

**Edit only `content/_index.md`, leave the partial untouched**
The section cards rendered by `home-sections.html` already do their job. The welcome text belongs above them in the standard Hugo page content area — no template changes needed unless the copy feels too constrained.

**Two short paragraphs, no headers**
Headers would make it feel like a resume. Two flowing paragraphs keep the tone light:
1. Who he is and the connecting thread (hands-on builder, from circuits to servers to sawdust)
2. What the site is and what each section holds

**No emoji in the body copy**
The current line leans on emoji as structure. The rewrite should let the words carry the tone instead — cleaner and more personal.

**Keep the Hugo front matter minimal**
Title, description, and `layout: hero` stay as-is. No new front matter fields required.

## Risks / Trade-offs

- [Copy tone] First-person writing can easily tip into formal or boastful → keep sentences short, use "I" naturally, avoid superlatives
- [Length] Too much text pushes the section cards below the fold → aim for 4–6 sentences total
