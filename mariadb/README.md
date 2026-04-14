## MariaDB Setup

1. Open a terminal in the MariaDB folder
2. Make sure the `db` volume exists (`docker volume ls`/`docker volume create db`)
3. Run `docker compose build db` to build the docker container
4. Run `setup.sh` to run the first time setup
