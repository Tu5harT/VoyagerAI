# Single Dockerfile for both Rasa and Actions

# Start from a Rasa image that includes Python and Node.js
FROM rasa/rasa:3.6.10-full

# Set working directory
WORKDIR /app

# Copy all project files
COPY . /app

# Switch to the root user to install packages
USER root

# Install Python dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install Node.js dependencies (for concurrently)
RUN npm install

# Switch back to the non-privileged user for security
USER 1001

# The command to run when the container starts
CMD [ "npm", "start" ]