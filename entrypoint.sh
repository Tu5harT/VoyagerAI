#!/bin/sh

# This script starts the Rasa server using Gunicorn for robust web serving.
# Gunicorn handles the web traffic, and gunicorn-cors handles the CORS headers.
# We are binding to port 10000 as required by Render.

gunicorn \
    -k uvicorn.workers.UvicornWorker \
    --cors-origin "*" \
    --workers 1 \
    --bind "0.0.0.0:10000" \
    rasa.core.run:app