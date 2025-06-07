#!/bin/sh
set -e

# This script starts the Rasa server with all necessary flags.
# The --cors "*" flag is essential for the REST channel.
# We are using port 10000 as configured for Render.
rasa run --enable-api --cors "*" -p 10000 --debug