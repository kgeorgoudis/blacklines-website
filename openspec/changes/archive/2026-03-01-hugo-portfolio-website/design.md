## Context

This is a greenfield project to build a personal portfolio website showcasing creative work (DIY/woodworking, sketchnotes/urban sketches) and technical content (DevOps posts). The site will be hosted on Render.com's free tier with automatic deployment via GitHub Actions.

**Key constraints:**
- Minimal maintenance overhead required
- Free hosting tier (Render.com)
- Single-contributor workflow (GitHub-based)
- No user interaction features (no contact forms, comments, etc.)
- Focus on content presentation and discoverability

## Goals / Non-Goals

**Goals:**
- Establish a lightweight, fast-loading portfolio website
- Automate deployment process completely (push-to-deploy)
- Create maintainable site structure for easy content addition
- Showcase three distinct content categories with appropriate presentation
- Minimize infrastructure and operational complexity

**Non-Goals:**
- User authentication or membership features
- Contact forms or email integration
- Backend database or API requirements
- Social features (comments, likes, sharing)
- Advanced analytics or tracking
- Mobile app or alternative interfaces

## Decisions

### Decision 1: Use Hugo for static site generation
**Rationale:** Hugo provides fast builds, minimal dependencies, and excellent template flexibility. Go-based, single binary deployment reduces operational burden and aligns with the "minimal maintenance" requirement.

**Alternatives considered:**
- Jekyll (Ruby-based, slower builds, more complex setup)
- Next.js/static export (requires Node.js, more complex CI/CD)
- Plain HTML/CSS (no content management, high maintenance)

**Why Hugo wins:** Fastest build times, single binary, large theme ecosystem, built-in taxonomy/organization support for content sections.

### Decision 2: Use minimal/clean theme (not heavily customized framework)
**Rationale:** A minimal theme reduces CSS/JS bloat, keeps the site fast and maintainable, and avoids "framework lock-in." The portfolio content (projects, sketches, posts) should be the focus, not complex design.

**Theme selection strategy:**
- Look for themes emphasizing typography and clean layouts
- Prefer themes with good documentation and active maintenance
- Ensure theme supports flexible content organization (tags, categories, sections)
- Avoid themes with unnecessary JavaScript dependencies

**Alternatives considered:**
- Custom-built theme from scratch (high maintenance burden)
- Heavy framework theme like Bootstrap-based (adds overhead, less maintainable)
- Minimal theme (selected approach)

### Decision 3: GitHub repository as single source of truth
**Rationale:** Content and configuration stored in Git provides version control, backup, and audit trail. Markdown files for content are human-readable and editor-agnostic.

**Content structure:**
```
content/
├── home/
├── diy/
│   ├── project1.md
│   ├── project2.md
│   └── images/
├── sketchnotes/
│   ├── sketch1.md
│   ├── sketch2.md
│   └── images/
└── devops/
    ├── post1.md
    ├── post2.md
    └── ...
```

### Decision 4: GitHub Actions for CI/CD pipeline
**Rationale:** Free, integrated with GitHub repository, no separate infrastructure required. Minimal configuration for building Hugo and deploying artifacts.

**Workflow design:**
1. Trigger on push to main branch
2. Run Hugo build in isolated GitHub Actions runner
3. Deploy built site to Render.com using webhook or CLI
4. Automated, zero-manual-intervention process

**Alternatives considered:**
- Netlify (proprietary, less control)
- GitLab CI (different platform)
- Manual deployment (requires manual steps, error-prone)

### Decision 5: Render.com free tier for hosting
**Rationale:** Free static site hosting, GitHub integration, automatic HTTPS, custom domain support (optional). Sufficient for personal portfolio with predictable traffic.

**Deployment approach:**
- Push generated site (`/public` directory) to Render
- Use Render's built-in GitHub webhook integration for auto-deploy
- Render serves pre-built static files directly (no build required on their end)

**Alternatives considered:**
- GitHub Pages (works, but less control over deployment)
- AWS S3 + CloudFront (more complex, costs)
- Self-hosted VPS (more maintenance)

## Risks / Trade-offs

| Risk | Mitigation |
|------|-----------|
| **Render free tier sleep behavior** | Site may sleep after inactivity; acceptable for personal portfolio with expected consistent traffic. Can upgrade tier if needed. |
| **Theme maintenance burden** | Pinning theme version in Hugo config; update only when necessary. Minimal custom CSS/JS reduces dependency issues. |
| **Image optimization** | Large unoptimized images can slow builds and site loading. Establish content guidelines for image sizes; automate via CI/CD if needed later. |
| **Render deployment limits** | Free tier has storage and bandwidth limits; sufficient for typical portfolio. Monitor usage; upgrade if exceeded. |
| **GitHub Actions rate limiting** | Unlimited for public repos; no concern for single-developer workflow. |
| **Breaking changes in theme or Hugo** | Version pinning and regular testing prevents surprise breakage. Test locally before pushing. |

## Migration Plan

**Phase 1: Setup**
1. Create GitHub repository for project
2. Initialize Hugo project with selected minimal theme
3. Configure Hugo `config.toml` for site structure and sections
4. Create content directory structure (diy/, sketchnotes/, devops/)

**Phase 2: Content & Design**
1. Create home page template with introduction and section navigation
2. Build content layouts for DIY section (project showcase)
3. Build content layouts for Sketchnotes section (image gallery)
4. Build content layouts for DevOps section (blog posts)
5. Add sample content to each section
6. Test locally with `hugo server`

**Phase 3: CI/CD Setup**
1. Create `.github/workflows/deploy.yml` GitHub Actions workflow
2. Configure Render.com webhook/API authentication
3. Test deployment pipeline with sample change
4. Verify site builds and deploys automatically

**Phase 4: Production**
1. Deploy to Render.com
2. Configure custom domain (if desired)
3. Verify all sections and content display correctly
4. Document content management process for future updates

**Rollback:** If deployment fails, previous version remains live. Fix, commit, and re-push to trigger new deployment.

## Open Questions

1. **Which specific Hugo theme should be used?** Recommendation: Evaluate themes like "Hermit", "Papermod", or "Stack" for clean, minimal aesthetics
2. **Should sketchnotes include full image galleries with lightbox/zoom, or static thumbnails?** Consider theme capabilities and simplicity vs. functionality
3. **Will DevOps posts include syntax highlighting for code blocks?** Built-in to Hugo; confirm theme supports it
4. **Custom domain or render subdomain?** User preference; does not affect architecture
5. **Image storage strategy: in Git repo or external CDN?** Starting with Git repo for simplicity; migration to CDN possible later if needed
