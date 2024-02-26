#!/bin/bash
export NAME=nem-deps
docker build -t cses/$NAME --net host . --no-cache
