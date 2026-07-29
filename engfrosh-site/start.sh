#!/bin/bash
set -e

echo "Loading environment..."
source environment

cd engfrosh/engfrosh_site/

echo "Starting nginx..."
nginx -g "daemon off;" &

echo "Cleaning old socket..."
rm -f engfrosh_site.sock engfrosh_site.sock.lock

case "${APP_MODE:-uvicorn}" in
  uvicorn)
    echo "Starting uvicorn..."
    exec uvicorn --workers "${WORKERS:-4}" \
                --proxy-headers \
                --uds /app/engfrosh/engfrosh_site/engfrosh_site.sock \
                engfrosh_site.asgi:application
    ;;
  granian)
    echo "Starting granian..."
    exec granian engfrosh_site.asgi:application \
                --workers "${WORKERS:-4}" \
                --interface asgi \
                --uds /app/engfrosh/engfrosh_site/engfrosh_site.sock
    ;;
  *)
    echo "Unknown APP_MODE: ${APP_MODE}"
    exit 1
    ;;
esac