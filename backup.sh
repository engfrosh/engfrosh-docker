#!/bin/bash
docker system prune -f
docker run --rm --volumes-from engfrosh -v /home/admin/backup:/backup-dir ubuntu tar czvf "/backup-dir/media-$(date '+%F').tar.gz" /usr/share/engfrosh_site/files/media/
docker run --rm --volumes-from mariadb -v /home/admin/backup:/backup-dir ubuntu tar czvf "/backup-dir/db-$(date '+%F').tar.gz" /var/lib/mysql/
