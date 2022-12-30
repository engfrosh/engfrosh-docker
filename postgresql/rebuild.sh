#!/bin/bash
export NAME=postgres
docker build -t engfrosh/$NAME . --no-cache

docker stop $NAME
docker rm $NAME

read -sp 'DB Password: (blank if already initialized) ' password
docker run -it -d --name $NAME --net host --mount source=db,target=/var/lib/postgresql/data -e POSTGRES_PASSWORD=$password -p 5432:5432 --restart unless-stopped engfrosh/$NAME
