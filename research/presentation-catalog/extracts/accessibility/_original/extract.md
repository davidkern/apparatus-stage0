# Intents from Accessibility Standards and Inclusive Design

This document explores communicative intents derived from WCAG guidelines, ARIA patterns,
screen reader conventions, and cognitive accessibility principles. The focus is on
intents that serve audiences with different abilities and that are distinct from
the provisional categories in the framework.

## Sources

Research drawn from:
- [WCAG 2.2 Overview](https://www.w3.org/WAI/standards-guidelines/wcag/)
- [ARIA Landmark Regions](https://www.w3.org/WAI/ARIA/apg/practices/landmark-regions/)
- [ARIA Live Regions](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Guides/Live_regions)
- [W3C Tables Tutorial](https://www.w3.org/WAI/tutorials/tables/)
- [W3C Form Instructions](https://www.w3.org/WAI/tutorials/forms/instructions/)
- [WCAG Cognitive Accessibility](https://www.w3.org/WAI/cognitive/)
- [WebAIM Skip Navigation](https://webaim.org/techniques/skipnav/)
- [W3C Headings Tutorial](https://www.w3.org/WAI/tutorials/page-structure/headings/)

---

## New Intent Category: Orientation

Accessibility work reveals a category of intents focused on helping users understand
where they are and how to navigate. Unlike Transition (which signals boundaries) or
State (which describes current situation), **Orientation** intents help users
establish and maintain spatial/structural awareness.

### Intent: Landmark

**Definition**: Identifying a region's role within the larger structure.

**Semantic Purpose**: The author wants the audience to understand what kind of
content a region contains and its function relative to other regions. Landmarks
enable non-sequential access to page sections.

**Examples**:
- HTML5 `<main>`, `<nav>`, `<aside>`, `<header>`, `<footer>` elements
- ARIA roles: `banner`, `navigation`, `main`, `complementary`, `contentinfo`
- "Primary navigation", "Sidebar", "Search" region labels
- Screen reader announcements: "Main landmark", "Navigation region"

**Containment**:
- Contains: Various content intents
- Contained by: Document/Page structure

**Relationship to Existing Categories**: Distinct from Hierarchy (which shows
nesting) and from Marker (which signals a boundary). Landmark identifies *what
kind* of region this is, not its position in a sequence.

**Forms**:
- *Typographic*: Visual layout (left column, header bar, footer area)
- *Auditory*: Announcement of region type on entry; navigable via screen reader shortcuts
- *Visual*: Spatial positioning, distinctive visual treatment per region type

---

### Intent: Location-in-Structure

**Definition**: Indicating where the current focus/position exists within a hierarchy.

**Semantic Purpose**: The author wants the audience to understand their current
position relative to the whole. Prevents disorientation in complex structures.

**Examples**:
- Breadcrumbs: "Home > Products > Electronics > Phones"
- `aria-current="page"` or `aria-current="location"` on navigation items
- Pagination: "Page 3 of 12"
- Document outline showing current section highlighted
- Screen reader announcement: "Heading level 2, 'Installation'"

**Containment**:
- Contains: Hierarchy (implied), Sequence (implied)
- Contained by: Navigation regions

**Relationship to Existing Categories**: Related to Hierarchy and Sequence but
distinct. Those describe the *structure*; Location-in-Structure describes
*where you are* within it.

**Forms**:
- *Typographic*: Breadcrumb trail, highlighted TOC entry, page numbers
- *Auditory*: "You are here" announcements, heading level announcements
- *Visual*: Highlighted path in tree, position marker in timeline

---

### Intent: Skip-Navigation

**Definition**: Offering a shortcut past repeated or non-essential content to
reach the primary content.

**Semantic Purpose**: The author wants to reduce the effort required to reach
what matters. Respects the audience's time and cognitive load.

**Examples**:
- "Skip to main content" links
- "Skip to search results" past filters
- Landmark-based navigation in screen readers
- Keyboard shortcuts to jump sections

**Containment**:
- Contains: (the link/mechanism itself)
- Contained by: Document structure

**Relationship to Existing Categories**: No direct analog. Related to the
structural concept of Landmark but focused on *bypassing* rather than
*identifying*. Could be seen as an accessibility-specific Command.

**Forms**:
- *Typographic*: Visible-on-focus link at top of page
- *Auditory*: First focusable element announced by screen reader
- *Visual*: Revealed link on keyboard focus

---

### Intent: Heading-Outline

**Definition**: Signaling the hierarchical structure of content through nested
heading levels.

**Semantic Purpose**: The author wants the audience to perceive the document's
organization at a glance and navigate by section. Enables both scanning and
structured navigation.

**Examples**:
- H1 through H6 heading hierarchy
- Nested sections in documentation
- Screen reader "headings list" navigation
- Table of contents derived from headings

**Containment**:
- Contains: Section content
- Contained by: Document structure

**Relationship to Existing Categories**: Related to Hierarchy but specifically
about document sectioning for navigation. The framework's Hierarchy describes
data relationships; Heading-Outline describes content organization for human
consumption.

**Forms**:
- *Typographic*: Visually distinct heading sizes, indentation
- *Auditory*: "Heading level N" announcements; H key navigation
- *Visual*: Outline view, document map

---

## New Intent Category: Announcement

Accessibility patterns reveal intents about *when* and *how* information is
communicated to users who cannot continuously monitor the display. This is
distinct from Emphasis (which marks importance) and from State (which describes
current situation).

### Intent: Polite-Update

**Definition**: Notifying the audience of new information without interrupting
their current task.

**Semantic Purpose**: The author wants the audience to learn about a change
when convenient, respecting their attention and workflow.

**Examples**:
- `aria-live="polite"` regions for status updates
- Toast notifications that don't steal focus
- "3 new messages" badges
- Loading complete indicators
- Search result count updates

**Containment**:
- Contains: Status, Progress
- Contained by: Application regions

**Relationship to Existing Categories**: Related to Status and Acknowledgement
but focused on *timing and interruption level* rather than content type.

**Forms**:
- *Typographic*: Badge, subtle notification area
- *Auditory*: Announced when user pauses; queued after current reading
- *Visual*: Non-modal indicator, status bar update

---

### Intent: Assertive-Update

**Definition**: Notifying the audience of critical information that requires
immediate attention, interrupting if necessary.

**Semantic Purpose**: The author wants to ensure the audience knows about
something urgent, even at the cost of interrupting their current focus.

**Examples**:
- `aria-live="assertive"` for critical errors
- `role="alert"` for immediate announcements
- Session timeout warnings
- Connection lost notifications
- Security warnings

**Containment**:
- Contains: Warning, Error
- Contained by: Application regions

**Relationship to Existing Categories**: Related to Warning and Error but
focused on delivery urgency. A Warning describes danger; Assertive-Update
ensures the warning is perceived immediately.

**Forms**:
- *Typographic*: Modal or prominent inline alert
- *Auditory*: Interrupts current announcement; "Alert:" prefix
- *Visual*: Attention-grabbing animation, focus trap

---

### Intent: State-Change

**Definition**: Announcing that an interactive element's state has changed.

**Semantic Purpose**: The author wants the audience to perceive dynamic changes
that visual users see automatically.

**Examples**:
- `aria-expanded="true/false"` for accordions, menus
- `aria-pressed="true/false"` for toggle buttons
- `aria-checked` for checkboxes
- `aria-selected` for list items
- "Expanded", "Collapsed", "Selected" announcements

**Containment**:
- Contains: (the state value)
- Contained by: Interactive components

**Relationship to Existing Categories**: Related to Status but specific to
interactive element state. Status describes system/process state;
State-Change describes UI component state.

**Forms**:
- *Typographic*: Visual indicator (chevron direction, button appearance)
- *Auditory*: State announced on activation
- *Visual*: Animation, icon change

---

## New Intent Category: Alternative-Representation

Accessibility requires that content be perceivable through different sensory
channels. This category covers intents that provide equivalent information
through a different mode.

### Intent: Text-Alternative

**Definition**: Providing textual description of non-text content.

**Semantic Purpose**: The author wants audiences who cannot perceive images,
icons, or other visual content to receive equivalent information through text.

**Examples**:
- Alt text for images: "Bar chart showing sales growth from Q1 to Q4"
- Icon labels: aria-label on icon buttons
- Decorative image markers: `alt=""`
- Long descriptions for complex diagrams

**Containment**:
- Contains: Description of visual content
- Contained by: Image/media containers

**Relationship to Existing Categories**: Related to Description/Explanation
but with a specific accessibility purpose. Not adding information but
*translating* information to a different mode.

**Forms**:
- *Typographic*: Alt attribute text (invisible but programmatically available)
- *Auditory*: Screen reader announces alt text in place of image
- *Visual*: N/A (the image itself is the visual form)

---

### Intent: Caption

**Definition**: Providing synchronized text representation of audio content.

**Semantic Purpose**: The author wants audiences who cannot hear audio to
receive the same information through reading.

**Examples**:
- Closed captions for video
- Real-time captioning for live events
- Caption tracks in media players
- Speaker identification in captions

**Containment**:
- Contains: Transcribed speech, sound effects descriptions
- Contained by: Media content

**Relationship to Existing Categories**: No direct analog. Like Text-Alternative
but for audio rather than images, and synchronized with the timeline.

**Forms**:
- *Typographic*: Overlaid text, synchronized with media
- *Auditory*: N/A (captions translate *from* audio)
- *Visual*: Text overlay on video frame

---

### Intent: Audio-Description

**Definition**: Providing spoken narration of important visual content in media.

**Semantic Purpose**: The author wants audiences who cannot see video content
to receive equivalent information about visual action, settings, and events.

**Examples**:
- Described video tracks
- "A woman enters the room and sits at the desk"
- Extended audio description during pauses
- Description of on-screen text in videos

**Containment**:
- Contains: Narrated visual information
- Contained by: Media content

**Relationship to Existing Categories**: Inverse of Caption—translates visual
to audio. Related to Text-Alternative but temporal rather than static.

**Forms**:
- *Typographic*: Transcript of audio description
- *Auditory*: Additional narration track interleaved with main audio
- *Visual*: N/A (describes visual for non-visual consumption)

---

### Intent: Transcript

**Definition**: Providing complete text representation of multimedia content.

**Semantic Purpose**: The author wants audiences to access all information
from audio/video content in a single text document, independent of the
media timeline.

**Examples**:
- Full transcript with speaker labels
- "[Sound of door opening]" for non-speech audio
- Descriptive transcript including visual descriptions
- Searchable text of podcast episodes

**Containment**:
- Contains: Caption content + Audio-Description content + Timing (optional)
- Contained by: Media supplements

**Relationship to Existing Categories**: Combines Caption and Audio-Description
into a unified document form. Enables text-based consumption of multimedia.

**Forms**:
- *Typographic*: Structured text document, possibly with timestamps
- *Auditory*: Can be read by screen reader (text-to-speech of transcription)
- *Visual*: Text document alongside or linked from media

---

## New Intent Category: Guidance

Accessibility work emphasizes helping users understand what to do and avoid
errors. This extends beyond Instruction (what to do) to include help
preventing mistakes.

### Intent: Input-Hint

**Definition**: Providing guidance on expected format or constraints for input.

**Semantic Purpose**: The author wants to prevent errors by clarifying
expectations before the user makes a mistake.

**Examples**:
- "Password must be at least 8 characters"
- "Format: MM/DD/YYYY"
- `aria-describedby` linking input to hint text
- Persistent helper text below form fields

**Containment**:
- Contains: Format specification, constraints
- Contained by: Form structure

**Relationship to Existing Categories**: Related to Instruction/Step but
preventive rather than directive. Not "do X" but "X should be like Y."

**Forms**:
- *Typographic*: Small text near input, distinct from label
- *Auditory*: Announced after field label when field receives focus
- *Visual*: Muted text, positioned near input

---

### Intent: Error-Identification

**Definition**: Identifying which input has a problem and what is wrong.

**Semantic Purpose**: The author wants the audience to locate and understand
errors so they can correct them.

**Examples**:
- `aria-invalid="true"` on erroneous fields
- "Email is required" - specific to field
- Error summary at top of form with links to fields
- Red border + error message near field
- "Please enter a valid email in the format name@domain.com"

**Containment**:
- Contains: Field identification + Error description
- Contained by: Form validation

**Relationship to Existing Categories**: Related to Error (which is more
general) but specific to input validation. Error says something is wrong;
Error-Identification says *which field* and *how to fix it*.

**Forms**:
- *Typographic*: Inline error near field, summary list at top
- *Auditory*: Error announced, focus moved to first error
- *Visual*: Red/warning styling, error icon

---

### Intent: Error-Suggestion

**Definition**: Providing specific guidance on how to correct an error.

**Semantic Purpose**: The author wants to help the audience fix their mistake
rather than just identifying it.

**Examples**:
- "Did you mean 'example@gmail.com'?"
- "Please use format: 123-456-7890"
- Autocorrect suggestions
- "Remove special characters from username"

**Containment**:
- Contains: Correction guidance, examples
- Contained by: Error-Identification

**Relationship to Existing Categories**: Related to Suggestion (in Instruction)
but specifically in error-recovery context. Part of Error-Handling composition.

**Forms**:
- *Typographic*: Inline suggestion after error message
- *Auditory*: Suggestion announced as part of error
- *Visual*: Suggested correction highlighted or selectable

---

## New Intent Category: Cognitive-Support

Accessibility for cognitive and learning disabilities reveals intents focused
on reducing mental load and supporting comprehension.

### Intent: Simplified-Content

**Definition**: Providing content at a lower reading/complexity level.

**Semantic Purpose**: The author wants to ensure content is understandable by
audiences with cognitive disabilities, lower literacy, or unfamiliar with
the domain.

**Examples**:
- Plain language versions of documents
- "Easy read" formats
- WCAG AAA reading level compliance
- Glossary links for technical terms
- Short sentences, common words

**Containment**:
- Contains: Same information, reduced complexity
- Contained by: Document alternatives

**Relationship to Existing Categories**: Related to Explanation but about
*how* content is written, not what type of content it is. A Definition
could be simplified, but Simplified-Content is the *treatment*.

**Forms**:
- *Typographic*: Plain language, short paragraphs, clear structure
- *Auditory*: Slower pace, clearer pronunciation, simpler vocabulary
- *Visual*: Clear diagrams, reduced visual noise

---

### Intent: Chunking

**Definition**: Breaking information into discrete, manageable units.

**Semantic Purpose**: The author wants to reduce cognitive load by limiting
how much must be processed at once.

**Examples**:
- Step-by-step wizards instead of single long form
- Accordions hiding secondary content
- "Read more" progressive disclosure
- Phone number as "123-456-7890" not "1234567890"
- One topic per section

**Containment**:
- Contains: Individual content chunks
- Contained by: Document/interface structure

**Relationship to Existing Categories**: Related to structure (Procedure
contains Steps) but focused on cognitive impact rather than just sequence.
Chunking is a *strategy* for presenting complex content.

**Forms**:
- *Typographic*: Clear section breaks, numbered steps, collapsible sections
- *Auditory*: Pauses between sections, clear segment markers
- *Visual*: Cards, stepped progress, visual separation

---

### Intent: Timeout-Warning

**Definition**: Alerting the user that a time limit is approaching.

**Semantic Purpose**: The author wants users who need more time (due to
disability, distraction, or complexity) to avoid losing work.

**Examples**:
- "Your session will expire in 2 minutes"
- "Extend session?" prompts
- Save reminders before timeout
- Countdown indicators for timed content

**Containment**:
- Contains: Duration remaining, Extension option
- Contained by: Session management

**Relationship to Existing Categories**: Related to Warning and Duration but
specific to accessibility requirement for "enough time" (WCAG 2.2). Also
related to Urgency from Aristotle research.

**Forms**:
- *Typographic*: Modal or banner with countdown
- *Auditory*: Assertive announcement with time remaining
- *Visual*: Countdown timer, progress indicator

---

## Intents for Data Relationships

Accessibility work on tables reveals intents about how data items relate
to each other.

### Intent: Header-Data-Association

**Definition**: Expressing the relationship between a data cell and its
header(s).

**Semantic Purpose**: The author wants the audience to understand what
a data value means by knowing its column/row headers.

**Examples**:
- Table `<th scope="col">` and `<th scope="row">`
- `headers` and `id` attributes for complex tables
- Screen reader: "Price: $500, Weight: 12 lbs"
- Implicit row/column headers in simple tables

**Containment**:
- Contains: The association (not the data itself)
- Contained by: Table structure

**Relationship to Existing Categories**: Related to Relational/Dependency
but specific to tabular data. The framework discusses tables as structure;
this intent is about *within-table* relationships.

**Forms**:
- *Typographic*: Visual alignment in rows/columns
- *Auditory*: Headers announced with each cell
- *Visual*: Highlighting header row/column

---

### Intent: Table-Caption

**Definition**: Providing a summary title that identifies the table's purpose.

**Semantic Purpose**: The author wants the audience to quickly understand
what data the table contains before examining it.

**Examples**:
- `<caption>` element: "Quarterly Sales by Region"
- Table summary descriptions
- "Table 3: Comparison of Framework Features"
- Screen reader: announces caption before reading cells

**Containment**:
- Contains: Brief description
- Contained by: Table structure

**Relationship to Existing Categories**: Related to the general concept of
labeling/naming. Similar to how Landmark names a region, Table-Caption
names a table.

**Forms**:
- *Typographic*: Heading above or within table
- *Auditory*: Announced on entering table, enables table navigation
- *Visual*: Distinct heading style for table title

---

## Grouping and Labeling Intent

### Intent: Control-Group

**Definition**: Indicating that related form controls belong together under
a common label.

**Semantic Purpose**: The author wants the audience to understand that
multiple controls share a common context or purpose.

**Examples**:
- `<fieldset>` with `<legend>`: "Payment Method"
- Radio button groups for single selection
- Checkbox groups for multiple selection
- Address fields grouped as "Shipping Address"

**Containment**:
- Contains: Related controls (radio buttons, checkboxes, etc.)
- Contained by: Form structure

**Relationship to Existing Categories**: Related to Grouping (in Relational)
but specific to interactive controls. The group label provides context that
individual labels cannot.

**Forms**:
- *Typographic*: Visual border/box, group heading
- *Auditory*: Legend announced when entering group; provides context for each control
- *Visual*: Visual grouping, shared border/background

---

### Intent: Supplementary-Description

**Definition**: Providing additional descriptive text associated with an element.

**Semantic Purpose**: The author wants to offer extra context or explanation
that supplements but doesn't replace the primary label.

**Examples**:
- `aria-describedby` pointing to help text
- Tooltip content for additional explanation
- "More info" expansions
- Instructions associated with form fields

**Containment**:
- Contains: Explanatory text
- Contained by: Element with primary label

**Relationship to Existing Categories**: Related to Aside and Elaboration but
programmatically associated with a specific element. The association is the key.

**Forms**:
- *Typographic*: Muted text near element, tooltip on hover
- *Auditory*: Announced after accessible name
- *Visual*: Secondary text styling, info icon with tooltip

---

## Summary: Proposed New Categories

Based on accessibility standards and inclusive design, the following new
categories may be warranted:

| Category | What it communicates | Distinct from existing? |
|----------|---------------------|------------------------|
| **Orientation** | Where user is, how to navigate | Yes—distinct from Transition/State |
| **Announcement** | When/how to notify of changes | Yes—about delivery timing |
| **Alternative-Representation** | Same content, different mode | Yes—cross-sensory translation |
| **Guidance** | Help avoiding/fixing errors | Partially overlaps Instruction |
| **Cognitive-Support** | Reduced complexity, manageable chunks | Yes—about processing load |

### Recommended Additions to Existing Categories

Some discovered intents fit existing categories:

| Intent | Recommended Category | Notes |
|--------|---------------------|-------|
| Timeout-Warning | Emphasis/Warning + Temporal | Time-sensitive warning |
| Heading-Outline | Relational/Hierarchy | Document structure specific |
| Table-Caption | State (naming) or new Labeling | Identifies purpose |

### Intents Requiring New Categories

| Intent | Proposed Category |
|--------|------------------|
| Landmark | Orientation |
| Location-in-Structure | Orientation |
| Skip-Navigation | Orientation |
| Polite-Update | Announcement |
| Assertive-Update | Announcement |
| State-Change | Announcement |
| Text-Alternative | Alternative-Representation |
| Caption | Alternative-Representation |
| Audio-Description | Alternative-Representation |
| Transcript | Alternative-Representation |
| Input-Hint | Guidance |
| Error-Identification | Guidance |
| Error-Suggestion | Guidance |
| Simplified-Content | Cognitive-Support |
| Chunking | Cognitive-Support |
| Header-Data-Association | Relational (tables) |
| Control-Group | Relational (forms) |
| Supplementary-Description | Explanation |

---

## Cross-Cutting Observations

### 1. Urgency as a Dimension

Accessibility reveals that *when* to communicate is as important as *what*.
The polite/assertive distinction suggests urgency might be orthogonal to
content type—any Status, Warning, or Error can be delivered politely or
assertively depending on criticality.

### 2. Mode Translation as an Intent Type

Alternative-Representation intents don't add information—they *translate*
existing information across sensory modes. This is a different relationship
than most intents have with their content.

### 3. Audience-Awareness Built In

Accessibility intents are inherently audience-aware. A Text-Alternative exists
*because* some audience members can't perceive images. This aligns with
Aristotle's emphasis on adapting to audience, but makes it structural.

### 4. Prevention vs. Recovery

The Guidance category distinguishes between:
- **Prevention**: Input-Hint (before error)
- **Identification**: Error-Identification (what's wrong)
- **Recovery**: Error-Suggestion (how to fix)

This sequence could inform Error-Handling composition more generally.

### 5. Hierarchy for Navigation vs. Data

Accessibility distinguishes between:
- **Document hierarchy** (Heading-Outline) for human navigation
- **Data hierarchy** (Header-Data-Association) for understanding data relationships

The framework's Hierarchy intent may need refinement to capture this distinction.

---

## Open Questions

1. **Is Orientation a category or part of State?** Location-in-Structure
   describes a current situation, like Status. But Landmark describes a
   structural role, not a state.

2. **Where does Announcement fit?** It's about *delivery* rather than
   *content*. Should urgency/timing be a property of all intents rather
   than a category?

3. **How do Alternative-Representations relate to forms?** A Caption
   is both an intent (translate audio to text) and a form (synchronized
   text overlay). Is mode-translation intent or form transformation?

4. **Should Guidance be merged with Instruction?** Input-Hint feels like
   instruction. But Error-Identification/Suggestion feel like Emphasis or
   State. The category coheres around error prevention/recovery.

5. **Cognitive-Support as treatment vs. intent?** Simplified-Content isn't
   a different intent than Definition—it's the same intent with different
   treatment. Should this be in the Forms dimension?
