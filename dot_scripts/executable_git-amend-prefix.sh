#!/usr/bin/env bash

# This script adds a prefix to commit messages in specified range.
#
# Usage:
#     # Add prefix to all the commits
#     git rebase --root --exec 'git-amend-prefix.sh "<PREFIX>"'
#
#     # Add prefix to the last 3 commits
#     git rebase -i HEAD~3 --exec 'git-amend-prefix.sh "<PREFIX>"'

set -euo pipefail

prefix="$1"

msg_file="$(mktemp)"
git log -1 --pretty=%B >"$msg_file"

# Avoid double-prefixing if we rerun it
first_line="$(head -n 1 "$msg_file")"

if [[ "$first_line" != "$prefix"* ]]; then
	{
		printf "%s%s\n" "$prefix" "$first_line"
		tail -n +2 "$msg_file"
	} >"$msg_file.new"

	git commit --amend -F "$msg_file.new" --no-edit >/dev/null
fi
