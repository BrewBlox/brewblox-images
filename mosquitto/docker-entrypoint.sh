#!/bin/ash
set -e

# Create files expected in mosquitto.conf
mkdir -p /mosquitto/include
touch /mosquitto/include/externals.passwd

# Set permissions
user="$(id -u)"
if [ "$user" = '0' ]; then
    chown -R mosquitto:mosquitto /mosquitto/include/* || true
fi

exec "$@"
