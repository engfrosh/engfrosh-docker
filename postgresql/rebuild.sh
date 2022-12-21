#!/bin/bash
export NAME=postgres
docker stop $NAME
docker rm $NAME
docker build -t engfrosh/$NAME . --no-cache

read -sp 'DB Password: (blank if already initialized) ' password
docker run -it -d --name $NAME --net host --mount source=db,target=/var/lib/postgresql/data -e POSTGRES_PASSWORD=$password -p 5432:5432 engfrosh/$NAME
