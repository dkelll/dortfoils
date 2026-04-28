# Obsidian Strategy for a Lead Programmer

> A practical system for organizing work notes, projects, people, and consulting engagements — with Obsidian Bases as the central navigation layer.

---

## Table of Contents

1. [Core Philosophy](#core-philosophy)
2. [Folder Structure](#folder-structure)
3. [Frontmatter Property Schema](#frontmatter-property-schema)
4. [Note Templates](#note-templates)
5. [Bases — Your Dashboard Layer](#bases--your-dashboard-layer)
6. [Tagging Strategy](#tagging-strategy)
7. [Linking Strategy](#linking-strategy)
8. [Weekly Triage Ritual](#weekly-triage-ritual)
9. [10 Obsidian Syntax Tips](#10-obsidian-syntax-tips)
10. [5 Plugins Worth Installing](#5-plugins-worth-installing)
11. [10 Styling Tips](#10-styling-tips)

---

## Core Philosophy

Use **PARA** (Projects, Areas, Resources, Archive) as your folder spine, but link notes freely like Zettelkasten. Folders define context and ownership. Links define relationships. **Bases are your live dashboards** — they replace the need to manually maintain index notes or remember where things are.
The key discipline: **define your data model in frontmatter first, then build Bases on top of it.** Every template below is designed so that Bases can filter, group, and display it without any extra work.

---

## Folder Structure

```
📁 00 - Inbox/           ← dump everything here first, triage weekly
📁 20 - Areas/           ← ongoing responsibilities with no end date
  📁 Products/           ← live products in enhancement/maintenance mode
    📁 ProductAlpha/
      - ProductAlpha – Overview.md
      - ProductAlpha – Technical.md
      - ProductAlpha – Decisions.md
      - ProductAlpha – Kanban.md
    📁 ProductBeta/
  📁 Leadership/
  📁 Consulting/
  📁 Personal/
📁 30 - Resources/       ← reference material, research, tech notes
  📁 Templates/
  📁 Tech Notes/
📁 40 - People/          ← one hub note per person you interact with regularly
📁 50 - Meetings/        ← all meeting notes, dated
📁 60 - Bases/           ← all .base dashboard files live here
📁 99 - Archive/         ← sunsetted products, closed engagements, old notes
```

> **Why a dedicated `60 - Bases` folder?** Keeping all `.base` files in one place makes them easy to find, pin to the sidebar, and manage. They are dashboards, not content — they deserve their own home.

---

## Frontmatter Property Schema

Consistency here is everything. Bases only reads frontmatter, so every note in a collection must use the same property names and types.

### Universal properties (every note)

```yaml
---
type: product | technical | meeting | 1on1 | person | account | resource | decision
tags: []
created: 2025-01-15
---
```

### Product notes

```yaml
---
type: product
tags: [product]
product: ProductAlpha
phase: enhancement | maintenance | sunset
sprint: 2025-Q2
owner: "[[People/Jane Smith]]"
started: 2025-01-01
priority: high | medium | low
---
```

### Meeting notes

```yaml
---
type: meeting
tags: [meeting]
date: 2025-01-15
product: ProductAlpha
attendees: ["[[People/Jane Smith]]", "[[People/Bob Jones]]"]
---
```

### 1:1 notes

```yaml
---
type: 1on1
tags: [1on1]
person: "[[People/Jane Smith]]"
relationship: manager | report-jr | report-mid | report-sr
date: 2025-01-15
---
```

### Person notes

```yaml
---
type: person
tags: [person]
name: Jane Smith
role: Product Owner
team: ProjectAlpha
relationship: manager | report-jr | report-mid | report-sr | stakeholder | consulting-client
---
```

### Consulting account notes

```yaml
---
type: account
tags: [consulting]
account: TeamX
contact: "[[People/Jane Smith]]"
status: active | paused | closed
started: 2025-01-01
---
```

---

## Note Templates

### Product Overview Note

```markdown
---
type: product
tags: [product]
product: ProductAlpha
phase: enhancement
owner: "[[People/Jane Smith]]"
started: 2025-01-01
sprint: 2025-Q2
priority: high
---

# ProductAlpha

## 🎯 Product Purpose
What does this product do? Who uses it? What's the business value?

## 👥 Stakeholders
- Owner: [[People/Jane Smith]]
- Tech Lead: you
- PM: [[People/Bob Jones]]

## 📋 Current Focus
What's the team working on this sprint/quarter? Key enhancement themes.

## 🔗 Related Notes
- [[Areas/Products/ProductAlpha/ProductAlpha – Technical]]
- [[Areas/Products/ProductAlpha/ProductAlpha – Decisions]]
- [[Areas/Products/ProductAlpha/ProductAlpha – Kanban]]
```

---

### Product Technical Note

```markdown
---
type: technical
tags: [product, technical]
product: ProductAlpha
---

# ProductAlpha – Technical Overview

## 🏗️ Architecture
Brief description. Link to diagrams or ADRs.

## ⚙️ Stack
- Language:
- Framework:
- Infra:
- CI/CD:

## 🔑 Key Decisions
| Decision | Rationale | Date |
|----------|-----------|------|
| Use Postgres | Existing team expertise | 2025-01-10 |

## ⚠️ Known Risks / Tech Debt

## 🔗 Related
- [[Areas/Products/ProductAlpha/ProductAlpha – Overview]]
```

---

### Meeting Note

```markdown
---
type: meeting
tags: [meeting]
date: 2025-01-15
product: ProductAlpha
attendees: ["[[People/Jane Smith]]", "[[People/Bob Jones]]"]
---

# 2025-01-15 – ProductAlpha Sprint Review

## 👥 Attendees
[[People/Jane Smith]], [[People/Bob Jones]]

## 📌 Agenda
1.

## 🗒️ Notes


## ✅ Action Items
- [ ] @you – do X by 2025-01-20
- [ ] @jane – do Y by 2025-01-22

## 🔗 Related
- [[Areas/Products/ProductAlpha/ProductAlpha – Overview]]
```

---

### 1:1 Note

```markdown
---
type: 1on1
tags: [1on1]
person: "[[People/Jane Smith]]"
relationship: report-sr
date: 2025-01-15
---

# 1:1 – Jane Smith – 2025-01-15

## 🌡️ Pulse Check
How are they doing overall? Energy level, blockers, morale?

## 📋 Their Topics


## 📋 My Topics


## 🚀 Career / Growth
Notes on trajectory, goals, feedback given.

## ✅ Action Items
- [ ]
```

---

### Person Hub Note

```markdown
---
type: person
tags: [person]
name: Jane Smith
role: Product Owner
team: ProductAlpha
relationship: stakeholder
---

# Jane Smith

## 📌 Context
Role, team, how you interact with them, what they care about.

## 🤝 Relationship Type
Product Owner on ProductAlpha. Key decision-maker for scope.

## 🗒️ Notes & Observations
Running notes on working style, preferences, things to remember.

## 🔗 Related Products
- [[Areas/Products/ProductAlpha/ProductAlpha – Overview]]
```

> **Note:** Meeting history and 1:1 history for this person are surfaced via a Base embedded in this note — see the [Bases section](#bases--your-dashboard-layer) below.

---

### Consulting Account Note

```markdown
---
type: account
tags: [consulting]
account: TeamX
contact: "[[People/Jane Smith]]"
status: active
started: 2025-01-01
---

# TeamX – Account

## 🎯 What They're Building
Brief description of their project and goals.

## 🤝 My Role
What I'm helping with, scope of involvement, boundaries.

## 📅 Engagement Log
| Date | Topic | Outcome |
|------|-------|---------|
| 2025-01-10 | Architecture review | Recommended X |

## ✅ Open Items
- [ ]
```

> **Note:** Meeting history for this account is surfaced via an embedded Base — see below.

---

## Bases — Your Dashboard Layer

Bases are `.base` files stored in `60 - Bases/`. They read your frontmatter and render live, filterable, editable views. You can open them as standalone dashboards or embed them inside notes with `![[60 - Bases/filename.base]]`.
> **Enable Bases:** Settings → Core Plugins → Bases → toggle on.

---

### Active Products Dashboard

**File:** `60 - Bases/Products – Active.base`

```yaml
filters:
  and:
    - file.inFolder("20 - Areas/Products")
    - type == "product"
    - 'phase != "sunset"'

properties:
  file.name:
    displayName: Product
  phase:
    displayName: Phase
  priority:
    displayName: Priority
  owner:
    displayName: Owner
  sprint:
    displayName: Current Sprint
  started:
    displayName: Started

views:
  - type: table
    name: Active Products
    order:
      - file.name
      - phase
      - priority
      - owner
      - sprint
      - started
    sort:
      - column: priority
        direction: ASC
    groupBy:
      property: phase
      direction: ASC
```

---

### All Products (by Phase)

**File:** `60 - Bases/Products – All.base`

```yaml
filters:
  and:
    - file.inFolder("20 - Areas/Products")
    - type == "product"

properties:
  file.name:
    displayName: Product
  phase:
    displayName: Phase
  priority:
    displayName: Priority
  owner:
    displayName: Owner
  sprint:
    displayName: Current Sprint
  started:
    displayName: Started

views:
  - type: table
    name: By Phase
    order:
      - file.name
      - phase
      - priority
      - owner
      - sprint
      - started
    groupBy:
      property: phase
      direction: ASC
    sort:
      - column: priority
        direction: ASC
```

---

### Meetings Dashboard

**File:** `60 - Bases/Meetings – All.base`

```yaml
filters:
  and:
    - file.inFolder("50 - Meetings")
    - type == "meeting"

properties:
  file.name:
    displayName: Meeting
  date:
    displayName: Date
  product:
    displayName: Product

views:
  - type: table
    name: All Meetings
    order:
      - file.name
      - date
      - product
    sort:
      - column: date
        direction: DESC

  - type: table
    name: This Week
    filters:
      and:
        - 'date >= today() - "7d"'
    order:
      - file.name
      - date
      - product
    sort:
      - column: date
        direction: DESC
```

---

### 1:1 History Dashboard

**File:** `60 - Bases/1on1s – All.base`

```yaml
filters:
  and:
    - file.inFolder("50 - Meetings")
    - type == "1on1"

properties:
  file.name:
    displayName: Note
  date:
    displayName: Date
  person:
    displayName: Person
  relationship:
    displayName: Relationship

views:
  - type: table
    name: All 1:1s
    order:
      - file.name
      - date
      - person
      - relationship
    sort:
      - column: date
        direction: DESC
    groupBy:
      property: person
      direction: ASC

  - type: table
    name: Direct Reports
    filters:
      or:
        - 'relationship == "report-jr"'
        - 'relationship == "report-mid"'
        - 'relationship == "report-sr"'
    order:
      - file.name
      - date
      - person
      - relationship
    sort:
      - column: date
        direction: DESC
    groupBy:
      property: person
      direction: ASC

  - type: table
    name: Leadership
    filters:
      and:
        - 'relationship == "manager"'
    order:
      - file.name
      - date
      - person
    sort:
      - column: date
        direction: DESC
```

---

### People Directory

**File:** `60 - Bases/People – Directory.base`

```yaml
filters:
  and:
    - file.inFolder("40 - People")
    - type == "person"

properties:
  file.name:
    displayName: Name
  role:
    displayName: Role
  team:
    displayName: Team
  relationship:
    displayName: Relationship

views:
  - type: table
    name: All People
    order:
      - file.name
      - role
      - team
      - relationship
    sort:
      - column: relationship
        direction: ASC
    groupBy:
      property: relationship
      direction: ASC

  - type: cards
    name: Cards View
    order:
      - file.name
      - role
      - team
```

---

### Consulting Accounts Dashboard

**File:** `60 - Bases/Consulting – Accounts.base`

```yaml
filters:
  and:
    - file.inFolder("20 - Areas/Consulting")
    - type == "account"

properties:
  file.name:
    displayName: Account
  status:
    displayName: Status
  contact:
    displayName: Contact
  started:
    displayName: Started

views:
  - type: table
    name: Active Accounts
    filters:
      and:
        - 'status == "active"'
    order:
      - file.name
      - status
      - contact
      - started
    sort:
      - column: started
        direction: DESC

  - type: table
    name: All Accounts
    order:
      - file.name
      - status
      - contact
      - started
    groupBy:
      property: status
      direction: ASC
```

---

### Embedded Base in a Person Note

To show meeting history directly inside a person's hub note, embed a Base that filters by their name. Add this to the bottom of any `40 - People/` note:

```markdown
## 📅 Meeting History
![[60 - Bases/Person – Meetings.base]]
```

**File:** `60 - Bases/Person – Meetings.base`

```yaml
filters:
  and:
    - file.inFolder("50 - Meetings")
    - file.hasLink(this.file)

properties:
  file.name:
    displayName: Meeting
  date:
    displayName: Date
  product:
    displayName: Product
  type:
    displayName: Type

views:
  - type: table
    name: Meetings with This Person
    order:
      - file.name
      - date
      - product
      - type
    sort:
      - column: date
        direction: DESC
```

> When embedded in a person note, `this.file` refers to that person's note. `file.hasLink(this.file)` matches any meeting note that links to this person — which works automatically because your meeting templates include `[[People/Name]]` in the attendees field.

---

### Embedded Base in a Consulting Account Note

Add this to the bottom of any account note in `20 - Areas/Consulting/`:

```markdown
## 📅 Engagement History
![[60 - Bases/Account – Meetings.base]]
```

**File:** `60 - Bases/Account – Meetings.base`

```yaml
filters:
  and:
    - file.inFolder("50 - Meetings")
    - file.hasLink(this.file)

properties:
  file.name:
    displayName: Meeting
  date:
    displayName: Date

views:
  - type: table
    name: Account Meetings
    order:
      - file.name
      - date
    sort:
      - column: date
        direction: DESC
```

---

## Tagging Strategy

Keep tags flat and purposeful. Don't over-tag — use frontmatter `type` for filtering in Bases, and tags for cross-cutting concerns that span multiple types.

| Tag | Use |
|-----|-----|
| `#product` | Any product-related note |
| `#meeting` | Meeting notes |
| `#1on1` | 1:1 notes |
| `#person` | Person hub notes |
| `#consulting` | Consulting account notes |
| `#decision` | Architectural or strategic decisions |
| `#risk` | Identified risks or blockers |
| `#action` | Notes with open action items |
| `#active` | Active accounts or focus areas |
| `#archived` | Archived content |
| `#personal` | Personal notes mixed into work vault |

**Rule of thumb:** if you'd filter by it in a Base, put it in frontmatter as a typed property. If you'd search for it across everything, use a tag.

---

## Linking Strategy

- Every meeting note links to the product (`[[Areas/Products/...]]`) and every person who attended (`[[People/...]]`)
- Every person note links to their products
- Every product has a hub (overview) note that links to its technical, decisions, kanban, and meeting sub-notes
- Every consulting account note links to the contact person
- Use `[[]]` liberally — the graph view becomes your org chart and the Bases `file.hasLink()` filter becomes your relationship query engine

---

## Weekly Triage Ritual

1. **Clear `00 - Inbox`** — file or delete everything, no note stays here more than a week
2. **Review open action items** — search `- [ ]` across the vault or use the Tasks plugin view
3. **Update product phases** — flip `enhancement` → `maintenance` or `sunset` as needed; your Bases dashboards update instantly
4. **Archive sunsetted products** — move to `99 - Archive/` and set `phase: sunset`
5. **Scan consulting accounts** — check each active account note for stale open items

---

## 10 Obsidian Syntax Tips

1. **Alias links** — `[[Jane Smith|Jane]]` displays "Jane" but links to the full note. Use this in prose so it reads naturally.
2. **Block references** — `[[Note^blockid]]` links to a specific paragraph, not just the note. Hover over a block, press `^` to generate an ID.
3. **Embed a note** — `![[Templates/Meeting]]` pulls the full content inline. Use this to embed your Base dashboards inside hub notes.
4. **Callouts** — `> [!warning] Watch out` renders as a styled callout block. Types: `info`, `tip`, `warning`, `danger`, `todo`, `question`, `success`. Stack them for visual structure.
5. **Heading links** — `[[ProjectAlpha#Architecture]]` jumps straight to that heading. Combine with aliases: `[[ProjectAlpha#Architecture|arch notes]]`.
6. **Inline metadata** — `status:: active` written in the note body works with Dataview without frontmatter. Useful for quick notes before you formalize them.
7. **Mermaid diagrams** — fenced code block with ` ```mermaid ` renders flowcharts, sequence diagrams, and Gantt charts natively. Great for architecture notes.
   ````
   ```mermaid
   graph TD
     A[Client] --> B[API Gateway]
     B --> C[Service A]
     B --> D[Service B]
   ```
   ````

8. **Tasks with due dates** — `- [ ] Do thing 📅 2025-01-20` is parsed by the Tasks plugin for due date filtering across all notes.
9. **Canvas files** — `.canvas` files let you visually map out a project's notes spatially. Great for architecture overviews or sprint planning boards.
10. **Folding** — any heading or bullet list can be folded with the arrow in the gutter. Use deep heading hierarchies (`##`, `###`, `####`) inside long notes so you can collapse sections you're not working in.

---

## 5 Plugins Worth Installing

1. **Templater** — smarter templates with dynamic values like `<% tp.date.now("YYYY-MM-DD") %>` and `<% tp.file.title %>`. Set it to auto-insert a template when creating a note in a specific folder — new file in `50 - Meetings/` automatically gets the meeting template.
2. **Tasks** — unified task management across all notes. Filter by due date, project tag, or assignee. Pairs with the `📅` date syntax to give you a cross-vault action item view without leaving Obsidian.
3. **Obsidian Git** — auto-commits your vault to a git repo on a schedule. Free backup, full version history, and you can sync across machines via a private repo. Set it and forget it.
4. **Kanban** — turns a markdown file into a Kanban board. Great for tracking project work items, sprint boards, or consulting engagement status without leaving Obsidian.
5. **Iconize** — adds icons and colors to folders and files in the sidebar. Makes the folder structure visually scannable at a glance — especially useful once you have 5+ active projects.

---

## 10 Styling Tips

1. **Minimal theme** — the cleanest base to build on. Install via Settings → Appearance → Manage. Pairs perfectly with the Style Settings plugin for GUI-based customization.
2. **Style Settings plugin** — gives you a GUI for colors, fonts, and spacing for themes that support it (Minimal does). No CSS required for most customizations.
3. **Custom font** — drop this in a CSS snippet (`Settings → Appearance → CSS Snippets → new .css file`):
   ```css
   body {
     --font-text: 'Inter', sans-serif;
     --font-monospace: 'JetBrains Mono', monospace;
   }
   ```
4. **Readable line length** — Settings → Editor → Readable line length → on. Long lines spanning the full window are brutal to read. This caps line width at a comfortable reading width.
5. **Colored folders via Iconize** — assign a different icon and accent color to each top-level folder. `20 - Areas` gets a blue folder, `40 - People` gets a green person icon, etc. Makes the sidebar scannable in under a second.
6. **Active line highlight** — most themes support this via Style Settings. Makes it immediately obvious where your cursor is in a dense note.
7. **Callout color overrides** — redefine callout colors to match your palette in a CSS snippet:
   ```css
   .callout[data-callout="warning"] {
     --callout-color: 255, 140, 0;
   }
   ```
8. **Hide scrollbars for a cleaner look**:
   ```css
   .cm-scroller { scrollbar-width: none; }
   ```
9. **Dark/light mode hotkey** — bind `Toggle light/dark mode` to a hotkey (Settings → Hotkeys → search "theme"). Flip based on environment without digging through settings.
10. **Stacked tabs** — Settings → Appearance → Interface → Stack tab histories. Lets you open multiple notes side by side and navigate back through your history per pane. Transforms how you work with linked notes.

---

## Getting Started — Roll This Out in Phases

Don't try to implement everything at once.

**Week 1:** Set up the folder structure. Create the meeting template. Use it for every meeting this week.
**Week 2:** Create a person note for every person you met with. Link your meeting notes to them.
**Week 3:** Create product overview notes for your active products. Fill in the frontmatter.
**Week 4:** Build your first Bases — start with `Products – Active.base` and `Meetings – All.base`. See your work come together.

The system compounds. The more consistently you fill in frontmatter, the more powerful the Bases become.
