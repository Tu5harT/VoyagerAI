# Single Dockerfile for both Rasa and Actions

# Start from the base Rasa image
FROM rasa/rasa:3.6.10

# Set working directory
WORKDIR /app

# Copy all project files
COPY . /app

# Switch to the root user to install packages
USER root

# Install Node.js and npm
RUN apt-get update -y && apt-get install -y nodejs npm

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install Node.js dependencies
RUN npm install

# Switch back to the non-privileged user
USER 1001

# === THE FINAL FIX ===
# Override the default entrypoint of the base image.
# We want to use npm as our starting point, not 'rasa'.
ENTRYPOINT [ "npm" ]

# Now, provide the argument to the new entrypoint ('npm').
CMD [ "start" ]