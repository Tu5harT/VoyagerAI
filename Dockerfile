# Single Dockerfile for both Rasa and Actions

# Start from the base Rasa image
FROM rasa/rasa:3.6.10

# Set working directory
WORKDIR /app

# Copy all project files
COPY . /app

# Switch to the root user to install packages
USER root

# === NEW: Install Node.js and npm ===
# First, update the package lists
RUN apt-get update -y
# Then, install nodejs and npm
RUN apt-get install -y nodejs npm

# Install Python dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install Node.js dependencies (for concurrently)
RUN npm install

# Switch back to the non-privileged user for security
USER 1001

# The command to run when the container starts
CMD [ "npm", "start" ]