#!/bin/bash
export NAME=discord-bot
docker stop $NAME
docker rm $NAME
docker build -t engfrosh/$NAME --network host . --no-cache
docker run -it -d --name $NAME --net host --restart unless-stopped engfrosh/$NAME
