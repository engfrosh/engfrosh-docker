# Docker Scripts

This repo contains `Dockerfiles` and a `docker-compose.yml` to build the Engfrosh site, discord bot, and database.

- The site and bot rely on a `engfrosh-deps` base image that must be built first.

    - If either the bot or site `requirements.txt` are changed, this image must be rebuilt, but for code changes, you can just rebuild the the bot/site image

    - A decent portion of the `engfrosh-deps` build is the apt install layer. If you don't need this, you can use the `build-deps-cached` profile to get docker to pull this layer from cache.

- The site and bot builds run a migration that requires the database to be online when building.

# Docker Compose Usage

* Full deps image rebuild

    `docker compose --profile build-deps build deps`

* Skip the apt install/upgrade layer and only update python packages

    `docker compose --profile build-deps-cached build deps`

* Build and start the database

    `docker compose build db && docker compose up db -d`

* Build and start the bot, or rebuild after code changes

    `docker compose build bot && docker compose up bot -d`

* Build and start the site, or rebuild after code changes

    `docker compose build site && docker compose up site -d`


