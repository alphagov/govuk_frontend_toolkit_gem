#!/bin/sh
set -e
git submodule update --init
git submodule foreach git pull origin master
rm -f Gemfile.lock
bundle install --path "${HOME}/bundles/${JOB_NAME}"
bundle exec rake
bundle exec rake publish_gem
