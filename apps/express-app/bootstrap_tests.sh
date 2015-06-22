#!/bin/bash

# Run tests in a different server process, via `npm test`

set -e

# Do setup
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
echo Running tests on port $PORT...
cd tests/e2e
if [ "$MODE" == record ]; then
    echo MATCH FOUND!
    rm -r req_cache
fi
mkdir -p req_cache

bundle install
bundle exec cucumber

# Clean up on exit, http://stackoverflow.com/a/22644006/3456726
trap "exit" INT TERM
trap "kill 0" EXIT
