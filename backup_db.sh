#!/bin/bash
docker system prune -f
docker exec mariadb mariadb-dump --all-databases > /var/backups/$(date +"%Y-%m-%d-%T")_backup.sql
mv mariadb/backups/* /var/backups/
