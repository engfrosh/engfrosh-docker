#!/bin/bash
export NAME=engfrosh
docker build -t engfrosh/$NAME --network host . --no-cache

docker stop $NAME
docker rm $NAME

MEDIA_DIR=$(pwd)/../media/

docker run -it -d --name $NAME -v $(pwd)/certs/:/etc/letsencrypt/ -v $MEDIA_DIR:/usr/share/engfrosh_site/files/media/ -e WORKERS=50 --net host --restart unless-stopped --log-driver=journald engfrosh/$NAME

chown -R 1000:1000 $MEDIA_DIR
