#! /bin/sh -
PROGNAME=$0

usage() {
  cat << EOF >&2
Usage: $PROGNAME [-t <title>]

* -t <title>: Title of recipe, will be kebab-cased for directory and url
*         -f: Force, if provided, will recreate the directory
EOF
  exit 1
}

force=false
while getopts t:f o; do
  case $o in
    (t) title=$OPTARG;;
    (f) force=true;;
    (*) usage
  esac
done
shift "$((OPTIND - 1))"


if [[ -z $title ]]; then
    echo "Error, requires '-t <title>' argument"
    exit 1
fi

title_lowercased=$(echo "$title" | awk '{print tolower($0)}')
dir="${title_lowercased// /-}"

file="recipes/$dir/index.md"

if [[ -e "recipes/$dir" ]]; then
    if $force; then
        echo "Found directory $dir, but running with -f, recreating"
        rm -rf "recipes/$dir"
    else
        echo "Found directory $dir, exiting"
        exit 0
    fi
fi

mkdir "recipes/$dir"
cp recipes/template.md $file
sed -i "" "s/TEMPLATE/$title/g" $file

echo "Created $file with title \"$title\""
