#!/bin/sh

set -e

echo 'Setting database...'

bundle check || bundle install
bundle exec rake db:drop
bundle exec rake db:create
echo 'DB created...'

echo 'Migrate tables...'
bundle exec rake db:migrate

echo 'Adding fake data...'
bundle exec rake db:seed

echo 'Finished!'