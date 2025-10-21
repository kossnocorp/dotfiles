#!/usr/bin/env bash

# The scripts preserves dev container's Git config credential bit created
# by VS Code. We restore it in the `./run_after_restore_devcontainer_gitconfig.sh`
# script after chezmoi applies dotfile version.

set -eo pipefail

git_config="${XDG_CONFIG_HOME:-$HOME/.config}/git/config"
state_dir="${XDG_STATE_HOME:-$HOME/.local/state}"
git_credential_state="$state_dir/chezmoi_gitconfig_credential"

mkdir -p "$state_dir"

# Skip if no git config file
[[ -f "$git_config" ]] || exit 0;

# Extract [credential] from git config
credential_chunk="$(awk '
  BEGIN { incred=0 }
  /^\[credential][[:space:]]*$/ { incred=1; print; next }
  /^\[.*]$/ { if (incred) { incred=0 } }
  { if (incred) print }
' "$git_config")"

# Save to state file
printf "%s" "$credential_chunk" > "$git_credential_state"