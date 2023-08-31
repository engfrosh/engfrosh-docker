#!/bin/bash
docker system prune -f
docker run --rm --volumes-from mariadb -v /home/admin/backup:/backup-dir ubuntu tar czvf "/backup-dir/db-$(date '+%F').tar.gz" /var/lib/mysql/
