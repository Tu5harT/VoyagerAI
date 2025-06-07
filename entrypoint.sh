#!/bin/sh

# This script starts the Rasa server with all necessary flags.
# The --enable-api and --cors "*" flags are essential for the REST channel.
# We are using port 10000 as configured for Render.
rasa run \
    --model models \
    --enable-api \
    --cors "*" \
    --debug \
    -p 10000