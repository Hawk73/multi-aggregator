#!/usr/bin/env bash

set -x
set -e

export RAILS_ENV=test

rm -rf tmp/*

RAILS_ENV=test bundle exec rake db:create && bundle exec rake db:migrate
bundle exec rake
