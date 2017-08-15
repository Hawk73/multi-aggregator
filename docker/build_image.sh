#!/usr/bin/env bash

set -x
set -e

# На Jenkins надо определять название ветки при помощи $GIT_BRANCH
if [ -z "$GIT_BRANCH" ]; then
    BRANCH_NAME=`git rev-parse --abbrev-ref HEAD`
else
    BRANCH_NAME=$(echo $GIT_BRANCH | sed -e "s|origin/||g")
fi

docker build . -f Dockerfile -t localhost/app/multi-aggregator:$BRANCH_NAME
