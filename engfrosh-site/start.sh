#!/bin/bash
set -e

echo "Loading environment..."
source environment

cd engfrosh/engfrosh_site/

echo "Starting nginx..."
nginx -g "daemon off;" &

echo "Cleaning old socket..."
rm -f engfrosh_site.sock engfrosh_site.sock.lock

echo "Starting uvicorn..."
exec uvicorn --workers "${WORKERS:-4}" \
             --proxy-headers \
             --uds /app/engfrosh/engfrosh_site/engfrosh_site.sock \
             engfrosh_site.asgi:application