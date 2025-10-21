#!/usr/bin/env bash

# The scripts restores dev container's Git config credential bit created
# by VS Code. We save it in the `./run_before_preserve_devcontainer_gitconfig.sh`
# script before chezmoi applies dotfile version.

set -eo pipefail

git_config="${XDG_CONFIG_HOME:-$HOME/.config}/git/config"
state_dir="${XDG_STATE_HOME:-$HOME/.local/state}"
git_credential_state="$state_dir/chezmoi_gitconfig_credential"

# Skip if no credential state saved
[[ -s "$git_credential_state" ]] || exit 0

mkdir -p "$(dirname "$git_config")"
touch "$git_config"

# Ensure file ends with a newline before appending
if [ -s "$git_config" ] && [ "$(tail -c1 "$git_config" | wc -l)" -eq 0 ]; then
  echo >> "$git_config"
fi

# Append saved credential state
cat "$git_credential_state" >> "$git_config"

rm -f "$git_credential_state"
