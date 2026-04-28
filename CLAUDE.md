# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Jekyll-based GitHub Pages site for Bradley Oesch's personal website, live at `pages.bradleyoesch.com`. Deploys automatically when changes are pushed to `main`.

## Development Commands

* `make setup` - one-time install of Jekyll dependencies via bundler
* `make run` - starts dev server at `http://localhost:4000` with live reload
* `make recipe` - interactive script to create a new recipe (prompts for title, creates directory, copies template, adds to index under "Uncategorized")

## Recipe System

### Adding a recipe

`make recipe` handles scaffolding, but after creating a recipe you still need to:
1. Fill out `recipes/<recipe-dir>/index.md` using the template format
2. Add a `hero.jpg` image to the recipe directory (or comment out the image line)
3. Move the entry in `recipes/index.md` from `## Uncategorized` to the correct `###` category (Breakfast, Marinades, Meals, Sides, Desserts, Drinks)

### Recipe index format

Categories in `recipes/index.md` use `###` headings (not `##`). The only `##` heading is `## Uncategorized` at the bottom, which is where `new.sh` appends new entries. Entries within each category are alphabetically sorted.

### Recipe content conventions

* Ingredients are bolded inline within instructions (e.g., `**4 large eggs**`)
* Measurements include both volume and weight where applicable (e.g., `1 cup (200g)`)
* Unicode fractions are used (⅛ ¼ ⅓ ½ ⅔ ¾), not decimal or spelled-out fractions
* Template sections (Prepare/Cook or Bake/Post-cook or Post-bake) are kept or removed as appropriate for the recipe