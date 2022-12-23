#!/bin/bash
export NAME=engfrosh
docker stop $NAME
docker rm $NAME
docker build -t engfrosh/$NAME --network host . --no-cache
docker run -it -d --name $NAME -v $(pwd)/certs/:/etc/letsencrypt/ --net host --restart unless-stopped engfrosh/$NAME
