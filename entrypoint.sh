#!/bin/sh

# This script starts the Rasa server with all necessary flags.
# We are telling Rasa to use Gunicorn as its web server.
rasa run \
    --enable-api \
    --cors "*" \
    --workers 1 \
    -p 10000 \
    --debug