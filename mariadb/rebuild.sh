#!/bin/bash
export NAME=mariadb
docker build -t engfrosh/$NAME . --no-cache

docker stop $NAME
docker rm $NAME

read -sp 'DB Password: (blank if already initialized) ' password
docker run -it -d --name $NAME --net host --mount source=db,target=/var/lib/mysql/ -e MARIADB_ROOT_PASSWORD=$password --restart unless-stopped engfrosh/$NAME
