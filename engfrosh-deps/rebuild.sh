#!/bin/bash
export NAME=engfrosh-deps
docker build -t cses/$NAME --network host . --no-cache
