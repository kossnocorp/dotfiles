#!/usr/bin/env bash

# This script starts a new shell using the AI agent environment.

set -eo pipefail

echo -e "⚡️ Starting agent shell environment\n"

export AGENT="true"
export GIT_CONFIG_GLOBAL="${HOME}/.config/git/agent.config"

"$SHELL"