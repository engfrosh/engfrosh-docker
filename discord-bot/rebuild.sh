#!/bin/bash
export NAME=discord-bot
docker build -t engfrosh/$NAME --network host . --no-cache

docker stop $NAME
docker rm $NAME

docker run -it -d --name $NAME --net host --restart unless-stopped --log-driver=journald engfrosh/$NAME
