#!/bin/bash
export NAME=nem-discord
docker build -t cses/$NAME --network httpd-net . --no-cache

docker stop $NAME
docker rm $NAME

docker run -it -d --name $NAME --net host --restart unless-stopped --log-driver=journald engfrosh/$NAME