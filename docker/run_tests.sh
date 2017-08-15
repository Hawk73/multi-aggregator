#!/usr/bin/env bash

set -x
set -e

docker-compose build
docker-compose run --rm --user="$(id -u):$(id -g)" app scripts/run_tests.sh
