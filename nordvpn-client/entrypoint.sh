#!/bin/bash

set -e

echo "Starting NordVPN daemon..."
/etc/init.d/nordvpn start

# Give the daemon a bit of time to spin up
sleep 5

echo "Logging in NordVPN..."

nordvpn login --token ${NORDVPN_TOKEN} 2>/dev/null || true
nordvpn set technology ${TECHNOLOGY}
nordvpn set killswitch on
nordvpn set autoconnect on
nordvpn connect

tail -f /dev/null # Keep the container running