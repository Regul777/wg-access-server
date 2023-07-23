#!/bin/sh
export WG_ADMIN_PASSWORD=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w30 | head -n1)
export WG_WIREGUARD_PRIVATE_KEY="$(wg genkey)"
echo "Your automatically generated admin password for the wg-access-server's web interface: $WG_ADMIN_PASSWORD"

docker-compose up