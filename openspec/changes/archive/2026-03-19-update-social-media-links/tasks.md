## 1. Configuration

- [x] 1.1 Add `[params.social]` section to `hugo.toml` with LinkedIn, Instagram, Substack, and email URLs
- [x] 1.2 Verify configuration syntax in hugo.toml is valid TOML

## 2. Template Development

- [x] 2.1 Check if Blowfish theme provides a built-in footer partial to extend
- [x] 2.2 Create `layouts/partials/social-links.html` that renders social links with icons
- [x] 2.3 Ensure social links include `aria-label` and semantic HTML (use `<a>` tags with proper attributes)
- [x] 2.4 Test social links partial locally with `hugo server`

## 3. Integration

- [x] 3.1 Check `_vendor/github.com/nunocoracao/blowfish/v2/layouts/partials/footer.html` to understand footer structure
- [x] 3.2 Create custom `layouts/partials/footer.html` that includes the social-links partial
- [x] 3.3 Verify footer renders correctly in local build

## 4. Link Verification

- [x] 4.1 Verify all social media links are clickable and open in new tabs
- [x] 4.2 Verify email link uses `mailto:` and opens default email client
- [x] 4.3 Test links on multiple browsers (Chrome, Firefox, Safari)

## 5. Responsive & Accessibility

- [x] 5.1 Test social links display correctly on mobile devices (iPhone, Android)
- [x] 5.2 Verify icons or text labels are visible and appropriately sized for touch
- [x] 5.3 Run accessibility check (lighthouse, axe, or manual WAVE test)
- [x] 5.4 Ensure links have proper contrast and are keyboard-accessible

## 6. Deployment

- [x] 6.1 Commit changes to git
- [x] 6.2 Push to main branch (triggers Cloudflare Pages build)
- [x] 6.3 Verify live site displays social links correctly
- [x] 6.4 Test social links on live site from multiple devices
