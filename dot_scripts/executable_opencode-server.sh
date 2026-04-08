#!/usr/bin/env bash

# This script provides API to manage the OpenCode server as a systemd service.
# It both provides environment for the service and user-facing commands.
# See /etc/systemd/system/opencode.service

set -euo pipefail

#region Commands

SERVICE_NAME="opencode"
SERVER_PORT=6904

start_server() {
	sudo systemctl start "$SERVICE_NAME"
}

stop_server() {
	sudo systemctl stop "$SERVICE_NAME"
}

restart_server() {
	sudo systemctl daemon-reload
	sudo systemctl restart "$SERVICE_NAME"
}

update_server() {
	mise use -g opencode@latest
	restart_server
}

attach_server() {
	local dir="${1:-.}"
	opencode attach "http://localhost:$SERVER_PORT" --dir "$dir"
}

service_exec() {
	# Add all bin paths
	export PATH="$HOME/.local/bin:$HOME/.scripts:$PATH"

	# Activate mise
	eval "$(mise activate bash)"

	# Start the server
	opencode serve --port "$SERVER_PORT" --hostname 127.0.0.1 --cors $OPENCODE_CORS
}

usage() {
	cat <<'EOF'
Usage: opencode-server.sh start|stop|restart|update|exec|attach

Commands:
  start    Start the OpenCode service
  stop     Stop the OpenCode service
  restart  Restart the OpenCode service
  update   Updates OpenCode and restarts the service
  exec     Run the OpenCode server directly (for the service file)
  attach   Attach to the running OpenCode server
EOF
}

#endregion

#region Match command

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
exec)
	service_exec
	;;
attach)
	attach_server "${@:2}"
	;;
*)
	usage
	exit 1
	;;
esac

#endregion
