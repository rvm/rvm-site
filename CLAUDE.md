# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the documentation site for [RVM (Ruby Version Manager)](https://rvm.io), built with **Nanoc 3.8.0** (static site generator). Content is written in Markdown and HAML, compiled to static HTML, and output to `public/`.

## Common Commands

```bash
# Install dependencies
bundle install

# Local development (two terminals)
guard          # Terminal 1: watches files and recompiles on change
nanoc view     # Terminal 2: serves site at http://localhost:3000

# Build site
rake compile   # Compiles to public/

# Run all checks (compile + stale links + internal links + SSL cert check)
rake test

# Individual checks
rake check_stale           # Find stale output files
rake check_internal_links  # Validate internal links
rake check_ssl             # Verify rvm.io SSL certificate expiry
```

Requires Ruby 3.4.5 (see `.ruby-version`). Uses RVM gemset `rvm-site`.

## Git Conventions

Use [Conventional Commits](https://www.conventionalcommits.org/) for commit messages (e.g. `docs:`, `fix:`, `chore:`, `feat:`).

## Architecture

### Build Pipeline (Nanoc)

The `Rules` file defines compilation and routing:
- **Markdown** (`.md`): processed through `rdiscount` → `auto_ids` → `pre_code` filters, then wrapped in `default` layout
- **HAML** (`.haml`): processed through `haml` filter, then wrapped in `default` layout
- **Blog posts** (`content/blog/YYYY-MM-DD-slug.md`): use `blog` layout, routed to `/blog/YYYY/MM/slug/`
- **SCSS** (`content/assets/css/`): compiled via Compass/Sass, partials (prefixed `_`) are excluded from output
- **Static assets**: images and JS copied as-is

### Custom Filters (`lib/code_filter.rb`)

- `PreCodeFilter` (`:pre_code`): transforms `<pre><code>` blocks into styled `<pre class="code">` elements
- `AutoIdsFilter` (`:auto_ids`): auto-generates anchor links for h1/h2/h3 headings

### Auto-Generated Pages (`lib/auto.rb`)

During preprocessing, `AutoHelper` scans all items for `tags` and `author` metadata, then generates tag/author listing pages and Atom feeds from templates in `layouts/templates/`.

### Key Directories

- `content/` — all site content (markdown docs, blog posts, assets)
- `content/blog/` — blog posts, named `YYYY-MM-DD-slug.md` with YAML front matter (`title`, `author`, `author_full`, `tags`, `created_at`)
- `layouts/` — HAML templates; `default.haml` is the main layout, `blog.haml` for posts
- `layouts/shared/` — partials (header, footer, navigation menus)
- `layouts/templates/` — ERB templates for auto-generated tag/author pages and feeds
- `lib/` — Ruby helpers and custom Nanoc filters
- `lib/tasks/` — Rake tasks loaded by `Rakefile`
- `public/` — compiled output (gitignored)

### Content Front Matter

Documentation pages use YAML front matter. Blog posts require: `title`, `author`, `author_full`, `tags` (array), `created_at` (date string).

### Helpers (`lib/`)

- `blog.rb` — blog listing, sorting, tag/author filtering
- `code_helper.rb` — code block rendering and menu generation
- `breadcrumbs_helper.rb` — breadcrumb navigation
- `helpers.rb` — standard Nanoc3 helper includes
