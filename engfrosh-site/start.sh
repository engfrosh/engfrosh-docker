#!/bin/bash
cd /home/ubuntu/engfrosh/engfrosh_site/
nginx

export ENGFROSH_DEPLOY_TYPE="PROD"
export DJANGO_SECRET_KEY="test12345" # Change this before deploying
export DISCORD_BOT_TOKEN=""

sudo -E -u ubuntu -g www-data daphne -u /home/ubuntu/engfrosh/engfrosh_site/engfrosh_site.sock engfrosh_site.asgi:application
