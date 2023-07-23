#!/bin/sh
set -e

SCRIPT_DIR="$(dirname $0)"

export WG_ADMIN_PASSWORD=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w30 | head -n1)
export WG_WIREGUARD_PRIVATE_KEY="$(wg genkey)"
echo "Your automatically generated admin password for the wg-access-server's web interface: $WG_ADMIN_PASSWORD"

cd "$SCRIPT_DIR"
# docker-compose up --build --force-recreate --remove-orphans --detach
# docker-compose logs -f --tail 100 wg-access-server
docker compose up --build --force-recreate --remove-orphans  