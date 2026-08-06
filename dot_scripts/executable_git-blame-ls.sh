#!/usr/bin/env bash

# This script lists the files in a given directory (or cwd by default) and shows
# the last commit that modified each file, along with the author and date of
# that commit.

dir="${1:-.}"

for path in "$dir"/*; do
	[ -f "$path" ] || continue

	info=$(git log -1 --format='%h | %ad | %an | %s' --date=short -- "$path")
	[ -n "$info" ] && printf '%s | %s\n' "$(basename "$path")" "$info"
done
