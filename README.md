# Pages

Created with [Github Pages][github-pages].

Live at [pages.bradleyoesch.com][live-url].

## Development

### Setup (one-time)
```bash
make setup
```

### Run locally
```bash
make run
```

The site will be available at `http://localhost:4000` with live reload.

## Drivetone

Added playlists and stuff to [/drivetone][drivetone].

## Recipes

Recipes live under [/recipes][recipes].

To create a new recipe, run the recipe script and follow the prompts.

```bash
make recipe
```

This creates a directory under `/recipes`.

1. Update `/recipes/<recipe-path>/index.md`
1. Add image at `/recipes/<recipe-path>/hero.jpg`
1. Update recipe index page at `/recipes/index.md`

[drivetone]: /drivetone
[github-pages]: https://pages.github.com/
[live-url]: http://pages.bradleyoesch.com/
[recipes]: /recipes
