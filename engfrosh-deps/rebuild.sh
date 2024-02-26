#!/bin/bash
export NAME=nem-deps
docker build -t cses/$NAME --network host . --no-cache
