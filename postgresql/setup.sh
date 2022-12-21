#!/bin/bash

read -sp 'Bot password: ' bot_pass

docker exec postgres psql -U postgres -c "CREATE USER engfrosh_site WITH PASSWORD 'there-exercise-fenegle'"
docker exec postgres psql -U postgres -c "CREATE USER engfrosh_bot WITH PASSWORD '$bot_pass'"

docker exec postgres psql -U postgres -c "CREATE DATABASE engfrosh_dev_2022_07_05"
docker exec postgres psql -U postgres -d engfrosh_dev_2022_07_05 -c "GRANT ALL ON SCHEMA public TO engfrosh_site"
docker exec postgres psql -U postgres -d engfrosh_dev_2022_07_05 -c "GRANT ALL ON SCHEMA public TO engfrosh_bot"
docker exec postgres psql -U postgres -c "GRANT ALL PRIVILEGES ON DATABASE engfrosh_dev_2022_07_05 TO engfrosh_site"
docker exec postgres psql -U postgres -c "GRANT ALL PRIVILEGES ON DATABASE engfrosh_dev_2022_07_05 TO engfrosh_bot"
