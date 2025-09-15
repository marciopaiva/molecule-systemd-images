#!/bin/bash
# Common entrypoint script for all images

set -e

# Initialize systemd if running as PID 1
if [ $$ -eq 1 ]; then
    exec /usr/sbin/init
fi

# Execute the command
exec "$@"