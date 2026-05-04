#!/bin/sh

set -e

echo "Esperando a PostgreSQL..."

# Railway usa PGHOST, PGPORT, PGUSER, PGPASSWORD, PGDATABASE
while ! nc -z "$PGHOST" "$PGPORT" 2>&1; do
  sleep 1
done

echo "PostgreSQL está listo."

# Si PORT no existe, usar 8069
ODOO_PORT=${PORT:-8069}

exec odoo \
    --http-port="$ODOO_PORT" \
    --proxy-mode \
    --db_host="$PGHOST" \
    --db_port="$PGPORT" \
    --db_user="$PGUSER" \
    --db_password="$PGPASSWORD" \
    --database="$PGDATABASE" 2>&1
