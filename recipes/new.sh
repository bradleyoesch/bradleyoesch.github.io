#! /bin/sh -
PROGNAME=$0

echo "What's the title of the recipe?"
read title

echo "Force recreate if already found? (y/n, defaults to no)"
read force

[[ "$force" = "y" ]] && force=true || force=false

title_lowercased=$(echo "$title" | awk '{print tolower($0)}')
dir="${title_lowercased// /-}"

file="recipes/$dir/index.md"

# if the directory already exists, remove it if forcing, otherwise exit
recreating=false
if [[ -e "recipes/$dir" ]]; then
    if [[ $force == true ]]; then
        echo "Directory recipes/$dir already exists, recreating"
        rm -rf "recipes/$dir"
        recreating=true
    else
        echo "Directory recipes/$dir already exists, exiting"
        exit 0
    fi
fi

# make the directory, copy the template, replace the title
mkdir "recipes/$dir"
cp recipes/template.md $file
sed -i "" "s/TEMPLATE/$title/g" $file

# if we're recreating, assume we've already done this and skip
if [[ $recreating == false ]]; then
    # if the header already exists, add the line to the end
    # if it doesn't, add the header too
    if grep -Fxq "## Uncategorized" recipes/index.md
    then
        echo "- [$title](./$dir)" >> recipes/index.md
    else
        echo "
## Uncategorized

- [$title](./$dir)" >> recipes/index.md
    fi
fi

echo "Created \"$title\""
echo $file
