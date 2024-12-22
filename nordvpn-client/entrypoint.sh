#!/bin/bash

set -e

echo "Starting NordVPN daemon..."
/etc/init.d/nordvpn start &

echo "Logging in NordVPN..."

nordvpn login --token ${NORDVPN_TOKEN}
nordvpn set technology ${TECHNOLOGY}
nordvpn set killswitch on
nordvpn set autoconnect on
nordvpn connect

tail -f /dev/null # Keep the container running