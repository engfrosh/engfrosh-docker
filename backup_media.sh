#!/bin/bash
cd /var
tar czvf "/var/backups/$(date '+%F-%T')-media.tar.gz" media/
