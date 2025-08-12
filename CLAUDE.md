# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Jekyll-based GitHub Pages site for Bradley Oesch's personal website. The site contains two main sections:
- **Recipes**: A collection of cooking recipes with standardized formatting
- **Drivetone**: Music playlists and related content
- **Laser**: Information on a screenplay

## Development Commands

### Setup (one-time)
```bash
make setup
```
Installs Jekyll dependencies via bundler. Run this once before development.

### Local Development
```bash
make run
```
Starts Jekyll development server at `http://localhost:4000` with live reload enabled.

### Recipe Management
```bash
make recipe
```
Creates a new recipe using an interactive script. This command:
1. Prompts for recipe title
2. Creates directory under `/recipes/` with URL-friendly name
3. Copies template and replaces placeholder title
4. Automatically updates the recipe index

### Jekyll Site (GitHub Pages)
This site is automatically built and deployed by GitHub Pages when changes are pushed to the `main` branch. No local Jekyll commands are needed for deployment.

## Architecture & Structure

### Recipe System
- **Template**: `recipes/template.md` - Standard recipe format with sections for ingredients, instructions, timing, etc.
- **Creation Script**: `recipes/new.sh` - Bash script that automates recipe creation and index updates
- **Index Management**: The script automatically maintains `/recipes/index.md` with categorized recipe listings
- **Image Convention**: Each recipe should have a `hero.jpg` image in its directory

### Content Organization
- **Recipes**: Organized by category (Breakfast, Meals, Desserts, etc.) in `/recipes/index.md`
- **Drivetone**: Music-related content in `/drivetone/` directory
- **Jekyll Layout**: Uses minimal theme with custom layouts in `_layouts/`

### File Naming
- Recipe directories use lowercase with hyphens (e.g., "Chocolate Chip Cookies" → "chocolate-chip-cookies")
- All recipe content lives in `index.md` files within recipe directories

## Key Files

- `_config.yml`: Jekyll configuration with minima theme and relative links plugin
- `makefile`: Contains the `recipe` target for new recipe creation
- `recipes/new.sh`: Interactive script for recipe generation
- `recipes/template.md`: Standard template with timing, ingredients, and instruction sections