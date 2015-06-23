#!/bin/bash

# Run tests in a different server process, via `npm test`

set -e

# Do setup
killall node || true # Ensure there are no backgrounded node servers currently running
npm install
export PORT=3001
npm start &

printf "Starting webserver"
until $(curl --output /dev/null --silent --head --fail http://127.0.0.1:$PORT); do
  printf '.'
  sleep 0.01
done # Block until server is up, http://stackoverflow.com/a/21189440/3456726
printf "\n"

# Do tests
cd tests/e2e
bundle install

echo Running tests on port $PORT...
bundle exec cucumber

# Clean up on exit, http://stackoverflow.com/a/22644006/3456726
trap "exit" INT TERM
trap "kill 0" EXIT
