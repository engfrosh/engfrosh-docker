#!/bin/bash
export NAME=engfrosh-deps
docker build -t engfrosh/$NAME --network httpd-net . --no-cache
