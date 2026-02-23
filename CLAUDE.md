# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the documentation site for [RVM (Ruby Version Manager)](https://rvm.io), built with **Docusaurus 3** (TypeScript/React). Content is written in Markdown, compiled to static HTML, and output to `build/`.

## Common Commands

```bash
# Install dependencies
npm install

# Local development
npm start        # Starts dev server at http://localhost:3000

# Build site
npm run build    # Compiles to build/

# Serve production build locally
npm run serve    # Serves build/ at http://localhost:3000
```

Requires Node.js >= 18.

## Git Conventions

- Use [Conventional Commits](https://www.conventionalcommits.org/) for commit messages **and PR titles** (e.g. `docs:`, `fix:`, `chore:`, `feat:`).
- When moving or renaming files, always use `git mv` to preserve file history. Apply content changes in a separate commit from the move.

## Architecture

### Docusaurus Configuration

- `docusaurus.config.ts` — main site configuration (URL, navbar, footer, plugins, Algolia search)
- `sidebars.ts` — sidebar navigation structure matching the doc categories
- `src/pages/index.tsx` — custom homepage
- `src/css/custom.css` — theme color overrides (Ruby red)

### Content Structure

- `docs/` — documentation pages organized by category (rvm, rubies, gemsets, workflow, integration, deployment, etc.)
- `blog/` — blog posts named `YYYY-MM-DD-slug.md` with front matter (`title`, `date`, `authors`, `tags`, `slug`)
- `blog/authors.yml` — blog author definitions
- `static/` — static assets (images, favicon, GPG keys, robots.txt)

### Key Settings

- Docs are served at root (`routeBasePath: '/'`) to match the original URL structure
- Markdown format is set to `md` (not MDX) via `markdown: { format: 'md' }` to avoid JSX parsing issues with HTML content
- Algolia DocSearch is configured for site search
