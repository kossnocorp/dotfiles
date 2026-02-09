#!/usr/bin/env bash

# This script sets up and starts OpenCode server.
# See /etc/systemd/system/opencode.service.

set -euo pipefail

# Activate mise environment
export PATH="$HOME/.local/bin:$PATH"
mise activate bash

SERVICE_NAME="opencode"

# Command fns

start_server() {
	sudo systemctl start "$SERVICE_NAME"
}

stop_server() {
	sudo systemctl stop "$SERVICE_NAME"
}

restart_server() {
	sudo systemctl restart "$SERVICE_NAME"
}

update_server() {
  mise use -g opencode@latest
	restart_server
}

usage() {
	cat <<'EOF'
Usage: opencode-server.sh start|stop|restart|update

Commands:
  start    Start the OpenCode service
  stop     Stop the OpenCode service
  restart  Restart the OpenCode service
  update   Updates OpenCode and restarts the service
EOF
}

# Match command

case "${1:-}" in
start)
	start_server
	;;
stop)
	stop_server
	;;
restart)
	restart_server
	;;
update)
	update_server
	;;
*)
	usage
	exit 1
	;;
esac
