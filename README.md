# docker-vpn-gateway
A Raspberry Pi VPN gateway sits behind my home internet router


## Pre-requisites

We need `tun` module on the host.

```
sudo modprobe tun
echo 'tun' | sudo tee -a /etc/modules
```

Add IPv4 forward on the host. And also set `rp_filter=2` to the host. Add these lines to the `/etc/sysctl.conf`.

Edit it:

```
sudo vim /etc/sysctl.conf
```

Or simply add a line if you are sure that it doesn't exist.

```
echo 'net.ipv4.ip_forward=1' >> /etc/sysctl.conf
echo 'net.ipv4.conf.all.rp_filter=2' >> /etc/sysctl.conf
```

Make the configuration effective.

```
sudo sysctl -p
```

## Usage

### Clone this project

```
git clone https://github.com/antonyho/docker-vpn-gateway.git
cd docker-vpn-gateway
```

### Edit the docker-compose.yml

Use your own token from NordVPN and configure it to the environment variable `NORDVPN_TOKEN` in the file.


### Start the docker containers

Set your NordVPN token to environmental variable.
```
export NORDVPN_TOKEN=the_token_from_nordvpn
```

Or put it into `.env` file in this project root directory.
```
# .env file
NORDVPN_TOKEN=the_token_from_nordvpn
```


```
docker-compose up -d
```


Add iptables routing on the VPN gateway host.

```
VPN_IF="wg0"  # or tun0/nordlynx
LAN_IF="eth0"

sudo iptables -t nat -A POSTROUTING -o "$VPN_IF" -j MASQUERADE
sudo iptables -A FORWARD -i "$LAN_IF" -o "$VPN_IF" -j ACCEPT
sudo iptables -A FORWARD -i "$VPN_IF" -o "$LAN_IF" -j ACCEPT

sudo netfilter-persistent save
```