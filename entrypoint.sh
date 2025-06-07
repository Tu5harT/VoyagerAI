#!/bin/sh
set -e

# Starting the Rasa server. CORS is now handled by cors_component.py.
rasa run --enable-api -p 10000 --debug