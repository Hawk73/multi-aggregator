#!/bin/bash
set -x
set -e

./docker/wait-for-it.sh db:5432
./docker/wait-for-it.sh redis:6379
#exec /bin/bash -l "$@"
#exec /bin/bash -l -c "$@"
$@
