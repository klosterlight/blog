#!/bin/bash
set -e

bundle install
#rake db:exists && rake db:migrate || rake db:setup

# Remove a potentially pre-existing server.pid for Rails.
rm -f /usr/src/app/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
