## ADDED Requirements

### Requirement: Homepage displays welcome content via homeInfoParams
The homepage SHALL use PaperMod's `homeInfoParams` to display a title and introductory content. The welcome text SHALL be consistent with the personal introduction established in the `homepage-welcome` spec (hands-on narrative, two short paragraphs, no emoji, no CV language).

#### Scenario: Homepage renders welcome section
- **WHEN** a visitor opens the homepage
- **THEN** a welcome section with title and introductory text SHALL appear at the top of the page

#### Scenario: Welcome text references site themes
- **WHEN** the homepage is rendered
- **THEN** the content SHALL reference at least two of the three site topics (woodworking/DIY, sketchnotes, DevOps/tech)

### Requirement: Profile photo appears on the homepage
The homepage SHALL display the profile photo (`/images/profile.jpeg`) as a circular image alongside the owner's name, birth year (1981), and location (Athens, Greece).

#### Scenario: Photo and bio info rendered
- **WHEN** the homepage is rendered
- **THEN** the profile photo, name "Konstantinos Georgoudis", "Born 1981", and "Athens, Greece" SHALL all be visible

#### Scenario: Photo renders as a circle
- **WHEN** the homepage is rendered in a browser
- **THEN** the profile image SHALL appear with `border-radius: 50%` styling

### Requirement: Homepage front matter is PaperMod-compatible
The `content/_index.md` front matter SHALL NOT contain Blowfish-specific keys (`layout: "hero"`). It SHALL be valid for PaperMod's home template.

#### Scenario: No Blowfish layout key in _index.md
- **WHEN** `content/_index.md` is inspected
- **THEN** it SHALL NOT contain `layout: "hero"` in its front matter

#### Scenario: Hugo builds homepage without template errors
- **WHEN** `hugo` or `hugo server` is run
- **THEN** the homepage SHALL render without "no layout file found" or template execution errors
