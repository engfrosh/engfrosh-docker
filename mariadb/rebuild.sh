#!/bin/bash
export NAME=mariadb
docker build -t engfrosh/$NAME . --no-cache

docker stop $NAME
docker rm $NAME

docker run -it -d --name $NAME --net host --mount source=db,target=/var/lib/mysql/ -e MARIADB_ROOT_PASSWORD="" --restart unless-stopped engfrosh/$NAME '--wait_timeout=31536000'
