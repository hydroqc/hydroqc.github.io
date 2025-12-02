# HydroQC Documentation - AI Agent Guide

## Project Overview

This is a **bilingual (French/English) Hugo documentation site** for HydroQC, a project that integrates Hydro-Québec customer portal data with home automation systems (primarily Home Assistant). The site uses the **Docsy theme** and is designed to run in a dev container.

- **Main repo**: Documentation site (you are here)
- **Related projects**: `Hydro-Quebec-API-Wrapper` (https://gitlab.com/hydroqc/hydroqc) (Python library), `hydroqc2mqtt` (https://gitlab.com/hydroqc/hydroqc2mqtt) (MQTT daemon), `hydroqc-hass-addons` (https://gitlab.com/hydroqc/hydroqc-hass-addons) (Home Assistant addon), 'hydroqc-ha' (https://github.com/hydroqc/hydroqc-ha) (home-assistant custom component)
- **Hosting**: GitLab-based (https://gitlab.com/hydroqc/hydroqc-docs)
- **Primary audience**: Home automation enthusiasts integrating with Hydro-Québec

## Architecture & Key Technologies

### Hugo + Docsy Theme
- **Static site generator**: Hugo v0.110.0+ (extended version required)
- **Theme**: Google Docsy (imported as Hugo module in `hugo.toml`)
- **Build output**: `public/` directory (gitignored)
- **Dev server**: Runs on port 1313, auto-starts in dev container

### Bilingual Content Structure
```
content/
├── en/          # English content (weight: 1)
├── fr/          # French content (default language)
```
- **Default language**: French (`defaultContentLanguage = "fr"`)
- **Language-specific folders**: Each language has mirrored directory structure under `docs/`
- **URL structure**: Language prefix always in URL (`defaultContentLanguageInSubdir = true`)

### Front Matter Conventions
All markdown files use Hugo front matter with these key fields:
- `title`: Page title
- `linkTitle`: Sidebar/navigation title
- `weight`: Controls ordering in navigation (lower = higher in list)
- `description`: Brief description (used in meta tags)
- `date` / `lastmod`: Timestamps (ISO 8601 format)
- `aliases`: Optional URL redirects for moved pages

Example:
```markdown
---
title: Configuration
linkTitle: Configuration
weight: 15
description: |
  Documentation for configuration options
date: 2022-09-20T13:08:04.762Z
lastmod: 2025-01-08T16:50:52.775Z
---
```

## Docsy Shortcodes (Critical)

The site heavily uses Docsy shortcodes. **Always use the correct syntax:**

### Alert Boxes
```markdown
{{< alert color="warning" title="Important" >}}
Your warning message here
{{< /alert >}}
```
Colors: `warning`, `info`, `primary`, `dark`

### Blocks (Homepage Only)
```markdown
{{< blocks/cover title="Welcome" image_anchor="top" height="full" >}}
Content here
{{< /blocks/cover >}}

{{% blocks/lead color="primary" %}}
Lead text with markdown support
{{% /blocks/lead %}}

{{% blocks/feature icon="fab fa-gitlab" title="Title" url="https://..." %}}
Feature description
{{% /blocks/feature %}}
```

**Key distinction**: Use `{{< >}}` for HTML content, `{{% %}}` for markdown content inside blocks.

### Badge Shortcode (Removed in Docsy 0.12.0)
The `{{< badge >}}` shortcode was removed in Docsy 0.12.0. Use emoji + bold text instead:
```markdown
⭐ **Recommended** (replaces {{< badge >}}Recommended{{< /badge >}})
⚠️ **Legacy** (replaces {{< badge color="warning" >}}Legacy{{< /badge >}})
✅ **Stable** (alternative format)
🔧 **Experimental** (alternative format)
```

### Images
```markdown
![img](/images/configuration/home-assistant-3.png)
```
Images stored in `static/images/` directory.

## Development Workflows

### Local Development (Dev Container)
The dev container auto-starts Hugo server:
```bash
# Server starts automatically on container launch
# Access at http://localhost:1313
# Changes auto-reload (--navigateToChanged flag)
```

Manual start if needed:
```bash
hugo server --bind 0.0.0.0 --disableFastRender --navigateToChanged
```

### Building the Site
```bash
# Generate static site to public/
hugo build

# Build with drafts
hugo build -D
```

### Creating New Content
```bash
# Use archetype template
hugo new content/en/docs/section-name/page-name.md

# Or manually create with proper front matter
```

### Dependency Management
- **Go modules**: `go mod download` (Docsy theme dependencies)
- **NPM packages**: `npm install` (PostCSS, Autoprefixer for asset processing)
- Both run automatically in dev container: `postCreateCommand: "npm install && go mod download"`

## Content Patterns & Conventions

### Section Index Pages
Each documentation section has an `_index.md` that acts as the landing page:
```markdown
---
title: "Documentation"
linkTitle: "Documentation"
weight: 20
menu:
  main:
    weight: 20
---
```

### Navigation Weight Strategy
- Lower weights appear first: Overview (1) → Installation (10) → Configuration (15) → Home-Assistant (20)
- Sub-pages within sections: Use increments of 2-5 for flexibility

### Hydro-Québec Dynamic Pricing Hours (2025 Update)
When documenting peak and anchor periods, use these official times from the 2025 tariff:
- **Morning peak**: 6h to 10h (06:00 to 10:00)
- **Evening peak**: 16h to 20h (16:00 to 20:00)
- **Morning anchor**: 1h to 4h (01:00 to 04:00) - 3 hours starting 5 hours before morning peak
- **Evening anchor**: 12h to 14h (12:00 to 14:00) - 2 hours starting 4 hours before evening peak

These apply to both Flex-D (DPC) and Winter Credit (CPC) programs.

### Code Block Formatting
Use triple backticks with language identifiers:
````markdown
```yaml
contracts:
  - name: maison
```

```bash
hugo server -D
```
````

### Multi-language Content Synchronization
When updating content:
1. **Always update BOTH `en/` and `fr/` versions** unless language-specific
2. Check for `aliases` fields if renaming pages (preserve old URLs)
3. Maintain parallel directory structures between languages

### Configuration Examples Pattern
The site includes many technical config examples (Docker, YAML, environment variables):
- Use clear variable naming: `HQ2M_CONTRACTS_0_NAME='maison'`
- Include comments explaining non-obvious settings
- Provide both environment variable AND config file examples where applicable

## Key Files & Their Purposes

- **`hugo.toml`**: Main Hugo config (languages, theme settings, params)
- **`frontmatter.json`**: Front Matter CMS configuration (VSCode extension)
- **`go.mod`/`go.sum`**: Docsy theme module dependencies
- **`package.json`**: PostCSS/Autoprefixer for CSS processing
- **`renovate.json`**: Dependency update automation
- **`.devcontainer/devcontainer.json`**: Dev container setup (Hugo, Go, Node.js)

## Important "Gotchas"

1. **Shortcode syntax matters**: `{{< >}}` vs `{{% %}}` — wrong one breaks rendering
2. **Weight conflicts**: Two pages with same weight cause unpredictable ordering
3. **Language folder mismatches**: Missing translations break navigation
4. **Image paths**: Always use `/images/...` (leading slash) for static assets
5. **Module updates**: Run `hugo mod get -u` to update Docsy, then `hugo mod tidy`
6. **Mermaid diagrams**: Enabled in config (`params.mermaid.enable = true`), use standard mermaid syntax

## Testing & Validation

```bash
# Check for broken links (after build)
hugo server && curl -I http://localhost:1313/

# Validate front matter
grep -r "^---$" content/ # Should find paired delimiters

# Check language parity
diff -r content/en/docs content/fr/docs --brief
```

## Common Tasks

### Adding a New Documentation Page
1. Create file in `content/en/docs/Section-Name/page-name.md`
2. Copy to `content/fr/docs/Section-Name/page-name.md`
3. Translate content while preserving structure and shortcodes
4. Ensure `weight` fits logical order in section
5. Update `lastmod` timestamp

### Updating Configuration Documentation
1. Locate in `content/{en,fr}/docs/Configuration/`
2. Update both language versions
3. Verify code examples are syntactically correct
4. Add alerts for breaking changes or important notes

### Fixing Broken Navigation
1. Check `weight` values in section `_index.md` files
2. Verify `linkTitle` is set (falls back to `title`)
3. Ensure parent `_index.md` exists for nested sections

## External Links & Resources

- **Docsy theme docs**: https://www.docsy.dev/
- **Hugo docs**: https://gohugo.io/documentation/
- **GitLab repo**: https://gitlab.com/hydroqc/hydroqc-docs
- **Discord support**: https://discord.gg/JaRfRJEByz (referenced throughout docs)

---

**When in doubt**: This is a documentation site, not application code. Prioritize clarity, consistency, and maintaining bilingual parity over code cleverness.
