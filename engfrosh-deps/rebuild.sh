#!/bin/bash
export NAME=engfrosh-deps
docker build -t engfrosh/$NAME --network host . --no-cache
#docker build -t engfrosh/$NAME --network host . --build-arg CACHE_BUST=$(date +%s)
