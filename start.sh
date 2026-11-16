#!/bin/sh
# Railway wrapper for Casdoor: sets safe defaults from Railway's variables, then runs the server.
# Casdoor reads lowercase settings (httpport, origin, driverName, dataSourceName, dbName, runmode,
# initAdminPassword) straight from the environment, so anything set on the service wins.
set -e

export httpport="${httpport:-${PORT:-8000}}"
export runmode="${runmode:-prod}"
export driverName="${driverName:-postgres}"

# Public URL and OIDC issuer: default to the service's Railway domain.
if [ -z "${origin:-}" ] && [ -n "${RAILWAY_PUBLIC_DOMAIN:-}" ]; then
  export origin="https://${RAILWAY_PUBLIC_DOMAIN}"
fi

# Password of built-in/admin, used only when Casdoor creates that user on the first start.
# Without it, Casdoor 4.2x leaves the password empty and lets the first visitor set it.
if [ -z "${initAdminPassword:-}" ] && [ -n "${CASDOOR_ADMIN_PASSWORD:-}" ]; then
  export initAdminPassword="${CASDOOR_ADMIN_PASSWORD}"
fi
if [ -z "${initAdminPassword:-}" ]; then
  echo "warning: initAdminPassword is not set; open Casdoor right away and set the admin password" >&2
fi

exec /server "$@"
