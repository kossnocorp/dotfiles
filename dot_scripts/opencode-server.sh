#!/usr/bin/env bash

# This script provides API to manage the OpenCode server as a systemd service.
# It both provides environment for the service and user-facing commands.
# See /etc/systemd/system/opencode.service

set -euo pipefail


#region Commands

SERVICE_NAME="opencode"

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

service_exec() {
  # Add all bin paths
  export PATH="$HOME/.local/bin:$HOME/.scripts:$PATH"

  # Activate mise
  mise activate bash | source

  # Start the server
  opencode serve --port 4096 --hostname 0.0.0.0 --cors $PC_HOST
}

usage() {
	cat <<'EOF'
Usage: opencode-server.sh start|stop|restart|update|exec

Commands:
  start    Start the OpenCode service
  stop     Stop the OpenCode service
  restart  Restart the OpenCode service
  update   Updates OpenCode and restarts the service
  exec     Run the OpenCode server directly (for the service file)
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
*)
	usage
	exit 1
	;;
esac

#endregion