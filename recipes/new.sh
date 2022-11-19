#! /bin/sh -
PROGNAME=$0

ERROR="\033[0;31m"
WARN="\033[1;31m"
SUCCESS="\033[0;32m"
RESET="\033[0m"

echo "${CYAN}What's the title of the recipe?${RESET}"
read title

if [[ $title == "" ]]; then
    echo "${ERROR}Title is required, exiting${RESET}"
    exit 0
fi

title_lowercased=$(echo "$title" | awk '{print tolower($0)}')
dir="${title_lowercased// /-}"

file="recipes/$dir/index.md"

# if the directory already exists, remove it if forcing, otherwise exit
overwriting=false
if [[ -e "recipes/$dir" ]]; then

    echo "Overwrite recipes/$dir? (y/n [n])"
    read force

    [[ "$force" == "y" ]] && force=true || force=false

    if [[ $force == true ]]; then
        echo "${WARN}Removing recipes/$dir to overwrite${RESET}"
        rm -rf "recipes/$dir"
        overwriting=true
    else
        echo "${ERROR}Exiting${RESET}"
        exit 0
    fi
fi

# make the directory, copy the template, replace the title
mkdir "recipes/$dir"
cp recipes/template.md $file
sed -i "" "s/TEMPLATE/$title/g" $file

# if we're overwriting, assume we've already done this and skip
if [[ $overwriting == false ]]; then
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

echo "${SUCCESS}Created recipe \"$title\"${RESET}"
echo "${SUCCESS}$file${RESET}"
