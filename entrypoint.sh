#!/bin/sh
set -e

# Define the path where models will be stored
MODELS_DIR="/app/models"

echo "Rasa entrypoint script started."

# Step 1: Train the model. This creates a .tar.gz file in the MODELS_DIR
echo "Training a new Rasa model..."
rasa train --out $MODELS_DIR

# Step 2: Find the name of the latest model trained
# This command looks in the models directory, lists files by time,
# and gets the name of the newest one.
LATEST_MODEL=$(ls -t $MODELS_DIR | head -n 1)
echo "Latest model found: $LATEST_MODEL"

# Step 3: Start the Rasa server and explicitly tell it which model file to use.
echo "Starting Rasa server with model: $LATEST_MODEL..."
rasa run \
    --model "$MODELS_DIR/$LATEST_MODEL" \
    --enable-api \
    --cors "*" \
    -p 10000 \
    --debug