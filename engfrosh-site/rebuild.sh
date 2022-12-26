#!/bin/bash
export NAME=engfrosh
docker stop $NAME
docker rm $NAME
docker build -t engfrosh/$NAME --network host . --no-cache

MEDIA_DIR=$(pwd)/../media/

rm -rf $MEDIA_DIR

docker run -it -d --name $NAME -v $(pwd)/certs/:/etc/letsencrypt/ -v $MEDIA_DIR:/usr/share/engfrosh_site/files/media/ --net host --restart unless-stopped engfrosh/$NAME
