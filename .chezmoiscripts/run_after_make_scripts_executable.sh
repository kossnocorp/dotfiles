#!/usr/bin/env bash

# The scripts makes ~/.scripts executable.

set -eo pipefail

find "$HOME/.scripts" -type f -name "*.sh" -exec chmod +x {} \;