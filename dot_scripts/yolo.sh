#!/usr/bin/env bash

set -eo pipefail

cmd="${1:-}"

case "$cmd" in
  claude|cl|c)
    exec claude --dangerously-skip-permissions
    ;;
  codex|co)
    exec codex --dangerously-bypass-approvals-and-sandbox
    ;;
  opencode|o)
    exec OPENCODE_PERMISSION=allow opencode --dangerously-bypass-approvals-and-sandbox
    ;;
  *)
    echo "Usage: $0 {claude|cl|c|codex|co|opencode|o}"
    exit 1
    ;;
esac
