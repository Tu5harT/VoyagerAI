#!/bin/sh
set -e

echo "Starting Rasa Entrypoint..."

# Step 1: Train the Rasa model if a model doesn't already exist.
# The 'rasa train' command will create the 'models' directory and save the model there.
echo "Training Rasa model..."
rasa train

# Step 2: Start the Rasa server with all necessary flags.
# It will now find and load the model we just trained.
echo "Starting Rasa server..."
rasa run --enable-api --cors "*" -p 10000 --debug