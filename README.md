# Blacklines Portfolio Website

A personal portfolio website showcasing DIY projects, sketchnotes, and DevOps technical content.

**Live Site:** [www.blacklines.gr](https://www.blacklines.gr)

## Overview

This is a static website built with [Hugo](https://gohugo.io/) and hosted on [Render.com](https://render.com/). The site features three main sections:

1. **DIY & Woodworking** - Handcrafted projects and woodworking creations
2. **Sketchnotes & Urban Sketches** - Visual observations and hand-drawn notes
3. **DevOps Posts** - Technical articles about infrastructure and deployment

## Tech Stack

- **Static Site Generator:** [Hugo](https://gohugo.io/) (v0.157+)
- **Theme:** [PaperMod](https://github.com/adityatelange/hugo-PaperMod)
- **Hosting:** [Render.com](https://render.com/) (free tier)
- **CI/CD:** GitHub Actions
- **Content:** Markdown files with Git version control

## Project Structure

```
.
├── content/                 # Content files
│   ├── diy/               # DIY project posts
│   ├── sketchnotes/       # Sketchnote posts
│   └── devops/            # DevOps article posts
├── static/                # Static assets
│   └── images/            # Images organized by section
├── layouts/               # Custom Hugo layouts
├── archetypes/            # Content templates
├── themes/                # Hugo themes (PaperMod as submodule)
├── hugo.toml              # Hugo configuration
├── .github/
│   └── workflows/
│       └── deploy.yml     # GitHub Actions CI/CD workflow
└── public/                # Generated site (git ignored)
```

## Local Development

### Prerequisites

- [Hugo](https://gohugo.io/installation/) (extended version)
- Git

### Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/www.blacklines.gr.git
   cd www.blacklines.gr
   git submodule update --init --recursive
   ```

2. Run the development server:
   ```bash
   hugo server --buildDrafts
   ```

3. Open your browser to `http://localhost:1313`

### Building the Site

To build the production site:

```bash
hugo
```

The generated site will be in the `public/` directory.

## Creating Content

### Adding a DIY Project

```bash
hugo new content diy/my-project.md
```

Edit the frontmatter and content:

```markdown
---
title: "My DIY Project"
date: 2024-03-01
draft: false
description: "Project description"
tags: ["woodworking", "furniture"]
featured_image: "/images/diy/project-featured.jpg"
images:
  - "/images/diy/project-01.jpg"
  - "/images/diy/project-02.jpg"
---

## Project Overview

Write your project description here...
```

### Adding a Sketchnote

```bash
hugo new content sketchnotes/my-sketch.md
```

### Adding a DevOps Post

```bash
hugo new content devops/my-article.md
```

## Image Guidelines

- **Featured images:** 600×400px (for project cards)
- **Gallery images:** 800×600px or larger
- **Format:** JPEG or PNG
- **Optimization:** Compress before uploading

Organize images in `static/images/`:
```
static/images/
├── diy/
├── sketchnotes/
└── devops/
```

## Deployment

### Automatic Deployment

Deployment is automatic via GitHub Actions:

1. Push changes to the `main` branch
2. GitHub Actions builds the site
3. Render.com is triggered to deploy
4. Site updates automatically (usually within 1-2 minutes)

### Manual Deployment

To manually trigger a deployment on Render:

1. Log in to [Render Dashboard](https://dashboard.render.com/)
2. Select your static site service
3. Click "Deploy Latest Commit"

## Configuration

### Site Settings

Edit `hugo.toml` to customize:

```toml
baseURL = 'https://www.blacklines.gr/'
title = 'Blacklines - Portfolio'
author = 'Your Name'
```

### Menu Navigation

Update the menu in `hugo.toml`:

```toml
[[menu.main]]
name = 'DIY'
url = '/diy/'
weight = 1
```

## Theme Customization

The site uses the [PaperMod](https://adityatelange.github.io/blog/posts/papermod-installation/) theme. Custom styles can be added to `layouts/` directory.

To override theme templates:
1. Copy the template from `themes/papermod/layouts/`
2. Paste into `layouts/` with the same path
3. Modify as needed

## Troubleshooting

### Build Fails

```bash
# Clear Hugo cache
rm -rf resources/

# Rebuild
hugo
```

### Theme Issues

Ensure the theme submodule is properly initialized:

```bash
git submodule update --init --recursive
```

### Deployment Not Triggering

1. Check GitHub Actions log in the repository
2. Verify `RENDER_API_KEY` and `RENDER_SERVICE_ID` are set in GitHub Secrets
3. Check Render.com webhook settings

## Maintenance

### Regular Tasks

- **Monthly:** Update Hugo and theme
  ```bash
  hugo version
  cd themes/papermod && git pull
  ```

- **Before deploying:** Build locally and test
  ```bash
  hugo server --buildDrafts
  ```

- **Monitor:** Check Render.com free tier usage

### Dependencies

- Hugo version pinned in `.github/workflows/deploy.yml`
- Theme version managed as git submodule
- No Node.js or npm dependencies

## Performance

Current metrics:
- **Build time:** ~150ms locally
- **Page count:** 39+ pages
- **Site size:** < 5MB
- **Load time:** < 1 second

## Future Enhancements

- [ ] Add search functionality
- [ ] Implement dark mode toggle
- [ ] Add reading time estimates
- [ ] Create RSS feed
- [ ] Add image optimization pipeline
- [ ] Implement analytics (optional)

## License

This website and its content are personal. Please ask before using any content.

## Contact

For questions about the site or content, please see the individual sections for more information.

---

**Last Updated:** March 2024
**Theme:** PaperMod
**Hosting:** Render.com
