FROM debian:bullseye

COPY nordvpn-run /etc/service/nordvpn/run
RUN chmod +x /etc/service/nordvpn/run
RUN apt update && apt install -y \
    gnupg2 \
    lsb-release \
    runit \
    iproute2 \
    wireguard-tools \
    curl \
    && rm -rf /var/lib/apt/lists/*
RUN sh -c 'echo "deb https://repo.nordvpn.com/deb/nordvpn/debian stable main" > /etc/apt/sources.list.d/nordvpn.list' \
    && curl -fsSL https://repo.nordvpn.com/gpg/nordvpn_public.asc | apt-key add -
RUN apt update && apt install -y nordvpn && rm -rf /var/lib/apt/lists/*

CMD ["/usr/bin/runsvdir", "/etc/service"]