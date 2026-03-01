## 1. Project Setup

- [x] 1.1 Create GitHub repository for project
- [x] 1.2 Clone repository locally
- [x] 1.3 Initialize Hugo project with `hugo new site .`
- [x] 1.4 Select and add minimal Hugo theme (Hermit, Papermod, or Stack recommended)
- [x] 1.5 Configure `hugo.toml` with site title, base URL, and output format settings
- [x] 1.6 Create content directory structure: `content/diy`, `content/sketchnotes`, `content/devops`
- [x] 1.7 Create `static/images` directory for image assets
- [x] 1.8 Test Hugo build locally with `hugo` command
- [x] 1.9 Test local server with `hugo server` and verify site loads

## 2. Home Page Implementation

- [x] 2.1 Create home page layout in `layouts/index.html` or `layouts/_default/home.html`
- [x] 2.2 Write welcome message content explaining site purpose
- [x] 2.3 Add friendly introduction text (1-2 paragraphs)
- [x] 2.4 Create navigation section linking to DIY, Sketchnotes, and DevOps sections
- [x] 2.5 Add brief description for each content section on home page
- [x] 2.6 Style home page to match selected theme
- [x] 2.7 Add optional site branding/logo if desired
- [x] 2.8 Verify home page displays correctly in local server

## 3. DIY Section Layout

- [x] 3.1 Create DIY content archetype: `archetypes/diy.md`
- [x] 3.2 Define DIY section layout in `layouts/diy/single.html` or `layouts/diy/list.html`
- [x] 3.3 Set up DIY section list view (gallery or card layout)
- [x] 3.4 Add support for project title, description, and featured image
- [x] 3.5 Create sample DIY project post: `content/diy/sample-project.md`
- [x] 3.6 Add sample project image to `static/images/diy/`
- [x] 3.7 Test DIY section rendering and navigation
- [x] 3.8 Verify DIY section appears in home page navigation

## 4. Sketchnotes Section Layout

- [x] 4.1 Create Sketchnotes content archetype: `archetypes/sketchnotes.md`
- [x] 4.2 Define Sketchnotes section layout for list and single views
- [x] 4.3 Set up image gallery or thumbnail display for sketchnotes
- [x] 4.4 Add support for title, date, and optional description
- [x] 4.5 Create sample sketchnote post: `content/sketchnotes/sample-sketch.md`
- [x] 4.6 Add sample sketch image to `static/images/sketchnotes/`
- [x] 4.7 Test Sketchnotes section rendering and image display
- [x] 4.8 Verify Sketchnotes section appears in home page navigation

## 5. DevOps Section Layout

- [x] 5.1 Create DevOps content archetype: `archetypes/devops.md`
- [x] 5.2 Define DevOps section layout (blog post style)
- [x] 5.3 Set up DevOps section list view with post titles and dates
- [x] 5.4 Configure syntax highlighting for code blocks (if theme supports)
- [x] 5.5 Create sample DevOps post: `content/devops/sample-post.md`
- [x] 5.6 Add code example to sample post to test syntax highlighting
- [x] 5.7 Test DevOps section rendering and post display
- [x] 5.8 Verify DevOps section appears in home page navigation
- [x] 5.9 Verify reverse chronological ordering of posts

## 6. CI/CD Pipeline Setup

- [x] 6.1 Create `.github/workflows` directory in repository
- [x] 6.2 Create `deploy.yml` GitHub Actions workflow file
- [x] 6.3 Configure workflow to trigger on push to main branch
- [x] 6.4 Add step to install Hugo in GitHub Actions runner
- [x] 6.5 Add step to build Hugo site (`hugo` command)
- [x] 6.6 Add step to upload build artifacts or deploy to Render
- [ ] 6.7 Generate Render.com authentication token/API key
- [ ] 6.8 Add Render authentication credentials to GitHub Secrets
- [ ] 6.9 Configure Render.com static site service
- [ ] 6.10 Verify GitHub Actions workflow syntax with `act` or by pushing test commit
- [ ] 6.11 Test workflow execution by pushing small change to main branch

## 7. Render.com Deployment

- [ ] 7.1 Create Render.com account (if not already created)
- [ ] 7.2 Create new Static Site service on Render
- [ ] 7.3 Connect GitHub repository to Render
- [ ] 7.4 Configure build command: `hugo`
- [ ] 7.5 Configure publish directory: `public`
- [ ] 7.6 Set environment variables if needed
- [ ] 7.7 Trigger initial build and deployment from Render dashboard
- [ ] 7.8 Verify site deploys successfully and is accessible
- [ ] 7.9 Test that deployed site matches local preview
- [ ] 7.10 Configure custom domain on Render (optional)

## 8. Testing & Verification

- [x] 8.1 Verify home page displays welcome message and section links
- [x] 8.2 Verify home page navigation links work correctly
- [x] 8.3 Verify DIY section displays sample project correctly
- [x] 8.4 Verify Sketchnotes section displays sample sketch and images
- [x] 8.5 Verify DevOps section displays sample post with proper formatting
- [ ] 8.6 Test responsive design on mobile device or mobile viewport
- [ ] 8.7 Verify all images load correctly on deployed site
- [ ] 8.8 Test that local changes trigger automatic rebuild/deployment
- [x] 8.9 Verify site performance (page load times are acceptable)
- [ ] 8.10 Verify HTTPS is configured and active on Render

## 9. Documentation & Maintenance Setup

- [x] 9.1 Create `README.md` with project overview
- [x] 9.2 Document how to add new content (DIY projects, sketchnotes, posts)
- [x] 9.3 Document content frontmatter/metadata structure
- [x] 9.4 Create image size recommendations and guidelines
- [x] 9.5 Document local development workflow (`hugo server` usage)
- [x] 9.6 Create GitHub repository description and README
- [x] 9.7 Add `.gitignore` to exclude build artifacts and local Hugo cache
- [x] 9.8 Document Render.com deployment and monitoring
- [ ] 9.9 Create content template examples for future posts
- [ ] 9.10 Test content creation process by adding one real post to each section

## 10. Launch & Monitoring

- [ ] 10.1 Remove or replace all sample/test content with real portfolio content
- [ ] 10.2 Review and test all three sections with real content
- [ ] 10.3 Verify SEO basics (meta tags, structured data if desired)
- [ ] 10.4 Do final content review for spelling, formatting, and accuracy
- [ ] 10.5 Test all links and internal navigation one final time
- [ ] 10.6 Monitor Render.com free tier usage (storage, bandwidth)
- [ ] 10.7 Set up monitoring alerts if desired (optional)
- [ ] 10.8 Publish site publicly (make repository public if private)
- [ ] 10.9 Share site with relevant audiences or on profile
- [ ] 10.10 Keep Hugo and theme dependencies updated (periodic maintenance)
