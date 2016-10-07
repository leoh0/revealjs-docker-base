#!/bin/bash
# reference : https://hochzehn.com/insights/docker-stopping-containers-softly.html

_term() {
  kill -TERM "$child" 2>/dev/null
}

trap _term SIGINT SIGTERM

# Main command
grunt serve &

child=$!
wait "$child"
