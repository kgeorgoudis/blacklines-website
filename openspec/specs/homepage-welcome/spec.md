# Spec: Homepage Welcome

## Purpose
Defines the personal welcome message displayed on the homepage, giving visitors a quick sense of who the site owner is and what the site covers.

## Requirements

### Requirement: Homepage displays a personal welcome text
The homepage SHALL display a short, friendly introduction in the page body that gives visitors a sense of who the site owner is and what the site is about. The text SHALL be no longer than 4–6 sentences across a maximum of two paragraphs.

#### Scenario: Visitor lands on the homepage
- **WHEN** a visitor opens the homepage
- **THEN** they SHALL see a personal introduction above the section cards

#### Scenario: Welcome text fits above the fold
- **WHEN** the page loads on a standard desktop viewport
- **THEN** both the welcome text and at least the section card titles SHALL be visible without scrolling

### Requirement: Welcome text reflects a hands-on, curious personality
The welcome copy SHALL convey a connecting thread across the owner's background: building and fixing things — whether circuits, servers, or furniture. The tone SHALL be conversational and first-person, not formal or resume-like.

#### Scenario: Text avoids CV language
- **WHEN** the welcome text is rendered
- **THEN** it SHALL NOT contain bullet lists, headers, dates, or job titles

#### Scenario: Text references the three site themes
- **WHEN** the welcome text is rendered
- **THEN** it SHALL reference or allude to at least two of the three site topics (woodworking/DIY, sketchnotes, DevOps/tech) so visitors understand what the site covers

### Requirement: No emoji in the welcome body copy
The welcome text body SHALL NOT use emoji characters. The surrounding theme and section cards may still use emoji; this requirement applies only to the written paragraph(s) in `_index.md`.

#### Scenario: Clean prose rendering
- **WHEN** the homepage body is rendered
- **THEN** no emoji characters SHALL appear within the paragraph text
