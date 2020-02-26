#!/bin/sh

if [ -d vendor/bundle ]; then
  cp -rf vendor/bundle /cache/.
fi

bundle check --path /cache/bundle || bundle install --jobs 2 --clean --standalone --path /cache/bundle

cp -rf /cache/bundle vendor/.
