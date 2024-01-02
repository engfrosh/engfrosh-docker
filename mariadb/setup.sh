#!/bin/bash

NAME=mariadb
SQLFILE='/setup.sql'

read -sp 'Root password: ' root_pass

docker exec -it $NAME /usr/bin/mariadb-secure-installation
docker exec $NAME bash -c "/usr/bin/mariadb-tzinfo-to-sql /usr/share/zoneinfo | /usr/bin/mariadb -u root --password=$root_pass mysql"
docker exec $NAME mariadb --password=$root_pass -e "CREATE DATABASE IF NOT EXISTS engfrosh CHARACTER SET utf8mb4; USE engfrosh; SOURCE $SQLFILE;"
