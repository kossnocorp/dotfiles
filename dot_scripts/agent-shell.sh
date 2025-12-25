#!/usr/bin/env bash

# This script starts a new shell using the AI agent environment.

set -eo pipefail

echo -e "⚡️ Starting agent shell environment\n"

export AGENT="true"

if [[ "$GIT_CONFIG_GLOBAL" == *"forward.config"* ]]; then
  export GIT_CONFIG_GLOBAL="${HOME}/.config/git/forward_agent.config"
else
  export GIT_CONFIG_GLOBAL="${HOME}/.config/git/agent.config"
fi

"$SHELL"