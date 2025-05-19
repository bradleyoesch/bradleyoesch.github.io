# Prompts

Some prompts I've iterated on to 

<details>
<summary><a href="#">Recipe Converter - copy/paste recipe to simplify into markdown</a></summary>
```
At the end of this prompt in the <recipe> tag is a freeform English recipe copied from the internet. Convert the recipe using the following rules:

# General
- Break the recipe into high-level sections with clear headers, each can have sub sections/headers:
  - Ingredients
  - Equipment
  - Instructions
  - Nutrition facts
- Infer equipment from context if not explicitly listed.
- All content and output must remain in English.
- Include a title with the name of the recipe
- Remove any extraneous description sections or extras that may come from copy/pasting from an internet source
- The output should be in a markdown block
example:
\`\`\`markdown
# output
\`\`\`

# Overview
- Include the following values if available, as bullets
  - Prep time
  - Cook time (if applicable)
  - Chill time (if applicable)
  - Total time
  - Yield

# Ingredients
- Maintain any grouping
- Standardize units:
  - Teaspoon -> tsp
  - Tablespoon -> T
  - Pounds -> lb or lbs
- Units:
  - Keep all units and ingredients unchanged with exceptions:
    - For sugars, flours, cocoa powder
      - If multiple units are given and includes grams (e.g. cups + grams), keep only grams
      - If no grams are listed, keep units unchanged
      - Example: `2½ cups (313g) all-purpose flour` -> `313g all-purpose flour`
    - For butter
      - Convert cups to tablespoons
      - Add number of sticks, where 8 tablespoons = 1 stick
      - Include grams if already given
      - Example: `1 cup (226g) unsalted butter -> `2 T (226g; 2 sticks) unsalted butter`
    - For liquids
      - If multiple units are given and includes milliliters (ml), remove milliliters and keep the other units unchanged
- Bold ingredient names throughout recipe
  - Example: `1 tsp baking powder` -> `1 tsp **baking powder**`
- If an ingredient contains a plus sign (+) or the word "plus" or indicates it's split or has an additional amount, italicize, suffix with " ^", and add a footnote
  - Footnote text: "Ingredients marked with ^ should be verified"
  - Do not include footnote if no ingredients needed the footnote
  - Example: `½ cup + 2 T (50g) unsweetened cocoa powder` -> `*½ cup + 2 T (50g) unsweetened cocoa powder* ^`
- Remove text that indicates spooned & leveled
- Shorten indicators for temperature to just the temperature
  - Example: `softened to room temperature` -> `room temperature`
  - Example: `at room temperature` -> `room temperature`
  - Example: `melt over a stove` -> `melted`
  - Example: `melt and cool for several minutes` -> `melted and cooled`
  - Example: `cold after putting in fridge for awhile` -> `chilled`
- Preserve other ingredients and formatting as-is.

# Equipment
- List any bowls, mixers, pans, whisks, etc. explicitly mentioned or clearly implied, including sizes

# Instructions
- Split into logical sections with short headers if appropriate (e.g. "Mix dries", "Prepare icing", "Bake").
- Use outline format:
  - Numbered top-level actions.
  - Sub-numbered sub-steps.
  - Ingredients and notes should be in bullet points under the relevant action.
  - Different bowls and major equipments can be their own numbered lines.
- Each section resets numbering
- Instructions must include ingredient amounts and units.
- Be concise. Add new lines for each major action, ingredient, or note.
- Extract and clearly state all cook/bake times and temperatures.

## Example instructions format:

\`\`\`markdown
1. In small bowl  
   1. Whisk  
      * 188g all-purpose flour  
      * ½ tsp baking powder  
      * ½ tsp kosher salt

2. In large bowl  
   1. 1 min - beat on high until smooth and creamy  
      * 2 sticks (230g; 1 cup) unsalted butter, room temperature  
   ...
\`\`\`

# Nutrition facts

- Estimate the nutrition facts
- Format in a table
- Give the amount and %DV
- Only include for the following values:
  - Serving size
  - Calories
  - Fat
  - Protein
  - Carbohydrates
  - Cholesterol
  - Sodium
  - Sugar
- Include a bulleted quick summary, contributors, overall health, etc

<recipe>
</recipe>
```
</details>
