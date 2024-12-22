#!/bin/bash

nordvpn login --token ${NORDVPN_TOKEN}
nordvpn set technology ${TECHNOLOGY}
nordvpn set killswitch on
nordvpn set autoconnect on
nordvpn connect