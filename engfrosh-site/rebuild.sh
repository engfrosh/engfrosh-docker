#!/bin/bash
export NAME=engfrosh
docker build -t engfrosh/$NAME --network httpd-net . --no-cache

docker stop $NAME
docker rm $NAME

MEDIA_DIR=$(pwd)/../media/

docker run -it -d --name $NAME -v $(pwd)/certs/:/etc/letsencrypt/ -v $MEDIA_DIR:/usr/share/engfrosh_site/files/media/ --net httpd-net --restart unless-stopped -e VIRTUAL_HOST=nem-scav.mycses.ca engfrosh/$NAME

chown -R $(whoami):$(whoami) $MEDIA_DIR
