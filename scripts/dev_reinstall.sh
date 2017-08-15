#!/usr/bin/env bash

rm -rf log/*
rm -rf public/tmp
rm -rf public/uploads
rm -rf tmp/*

bundle install

bundle exec rake db:drop && bundle exec rake db:create && bundle exec rake db:migrate && bundle exec rake db:seed
RAILS_ENV=test bundle exec rake db:migrate

annotate
