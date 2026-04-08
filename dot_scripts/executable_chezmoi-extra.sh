#!/usr/bin/env bash

# This script provides CLI to manage the chezmoi instance.

set -euo pipefail

CHEZMOI_SOURCE_DIR="$(chezmoi source-path)"
DOTFILES_DIR="$HOME/code/dotfiles"
DOTFILES_HOME_REL_DIR="$(realpath --relative-to="$HOME" "$DOTFILES_DIR")"

#region Commands

secret_command() {
	fnox --config "$CHEZMOI_SOURCE_DIR/fnox.toml" "$@"
}

sync_command() {
	echo "🚧 Syncing chezmoi from $DOTFILES_HOME_REL_DIR"
	cd "$DOTFILES_DIR"

	if ! git remote show origin -n | rg git@github.com:kossnocorp/dotfiles.git &>/dev/null; then
		echo "🔴 Local remote is not set to github.com:kossnocorp/dotfiles.git"
		exit 1
	fi

	if ! output=$(rsync -av --delete --exclude .git "$PWD" "$CHEZMOI_SOURCE_DIR" 2>&1); then
		echo "🔴 rsync failed"
		echo "--- Output ------------------------------------------"
		echo "$output"
		echo "-----------------------------------------------------"
		exit 1
	fi

	# If --apply is passed, apply the changes after syncing
	if [[ " $* " == *" --apply "* ]]; then
		chezmoi apply
	fi
}

usage() {
	cat <<'EOF'
Usage: chezmoi-extra.sh secret|sync

Commands:
  secret   Interop for chezmoi secret command
  sync     Sync local changes to the chezmoi source directory
EOF
}

#endregion

#region Match command

case "${1:-}" in
secret)
	secret_command "${@:2}"
	;;
sync)
	sync_command "${@:2}"
	;;
*)
	usage
	exit 1
	;;
esac

#endregion
