#!/bin/bash
docker system prune -f
docker run --rm --volumes-from engfrosh -v /home/admin/backup:/backup-dir ubuntu tar czvf "/backup-dir/media-$(date '+%F-%T').tar.gz" /usr/share/engfrosh_site/files/media/
