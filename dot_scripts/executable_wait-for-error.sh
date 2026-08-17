#!/usr/bin/env bash

# This script runs a given bash command repeatedly until it fails.
#
# It is useful for capturing flaky errors in tests that may not fail every time
# they are run.

set -u

if [[ "${1:-}" != "--" ]]; then
	echo "Usage: $0 -- <bash code>"
	exit 2
fi

shift

if (($# == 0)); then
	echo "🔴 Error: no command provided"
	exit 2
fi

code="$*"
count=1

echo "$code"

while true; do
	echo "--- Run #$count"
	bash -c "$code"
	echo "-----------------------------------------------------"
	status=$?

	if ((status != 0)); then
		echo "🛑 Failed on run #$count with exit code $status"
		exit "$status"
	fi

	((count++))
done
