#!/bin/bash
docker exec mariadb mariadb-dump --all-databases > /var/backups/$(date +"%Y-%m-%d-%T")_backup.sql
