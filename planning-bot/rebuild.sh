#!/bin/bash
export NAME=planning-bot
docker stop $NAME
docker rm $NAME
docker build -t engfrosh/$NAME --network host . --no-cache
docker run -it -d --name $NAME -v source=certs,target=/etc/letsencrypt/ --net host engfrosh/$NAME
