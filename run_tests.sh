#!/usr/bin/env bash

set -e

export RAILS_ENV=test

DUMMY_APP="${PWD}/test/dummy"

if [ "${PLUGIN}x" = "x" ]; then
  PLUGIN="${PWD##*/}"
fi
export PLUGIN


if [ "${REPO_URL}x" = "x" ]; then
  REPO_URL="https://github.com/bold-app/bold.git"
fi
if [ "${APP_VERSION}x" = "x" ]; then
  APP_VERSION=master
fi

GEMS="${DUMMY_APP}/vendor/gems"
VENDOR_DIR="${GEMS}/${PLUGIN}"

if [ ! -d $DUMMY_APP ]; then
  echo "cloning ${REPO_URL}..."
  git clone --depth 50 --branch=${APP_VERSION} ${REPO_URL} ${DUMMY_APP}
  cp "${DUMMY_APP}/test/support/database.travis.yml" "${DUMMY_APP}/config/database.yml"
  echo "gem '${PLUGIN}', path: '${VENDOR_DIR}'" > "${DUMMY_APP}/Gemfile.local"
fi

mkdir -p $GEMS
ln -sf $PWD $VENDOR_DIR

cd $DUMMY_APP
bundle install
bundle exec rake bold:plugin:test

