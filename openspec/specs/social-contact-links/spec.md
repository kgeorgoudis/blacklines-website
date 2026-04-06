## ADDED Requirements

### Requirement: Display social media profile links
The system SHALL display links to the user's social media profiles including LinkedIn, Instagram, and Substack with appropriate icons or visual indicators.

#### Scenario: Homepage social links display
- **WHEN** a visitor views the homepage
- **THEN** social media links are visible with icons representing each platform (LinkedIn, Instagram, Substack)

#### Scenario: Profile links are clickable and functional
- **WHEN** a visitor clicks a social media link
- **THEN** the link opens the respective social media profile in a new tab

### Requirement: Display email contact link
The system SHALL display the primary email address (kgeor@blacklines.gr) as a clickable email link or contact button.

#### Scenario: Email link sends message
- **WHEN** a visitor clicks the email link
- **THEN** their default email client opens with the email address pre-filled in the "To" field

#### Scenario: Email is visible on contact section
- **WHEN** a visitor views the contact information
- **THEN** the email address is prominently displayed with a mail icon

### Requirement: Links are responsive and accessible
The system SHALL ensure social and email links are accessible on all device sizes and follow accessibility standards.

#### Scenario: Links display on mobile devices
- **WHEN** a visitor accesses the site on a mobile device
- **THEN** social and email links are visible and appropriately sized for touch interaction

#### Scenario: Links have proper semantic HTML
- **WHEN** assistive technology scans the page
- **THEN** social and email links have proper alt text and aria labels describing their purpose

### Requirement: Profile URLs are configurable
The system SHALL support storing social media profile URLs in a configuration file for easy updates.

#### Scenario: Links update from configuration
- **WHEN** profile URLs are updated in the site configuration
- **THEN** links on the website automatically reflect the new URLs without code changes

#### Scenario: Links include specific profiles
- **WHEN** the configuration is loaded
- **THEN** the following profiles are displayed: LinkedIn (https://www.linkedin.com/in/kgeor/), Instagram (https://www.instagram.com/k.georgoudis/), Substack (https://kgeor.substack.com/), Email (kgeor@blacklines.gr)
