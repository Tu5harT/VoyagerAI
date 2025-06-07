# Final, working Dockerfile for single service

FROM rasa/rasa:3.6.10

WORKDIR /app

# Switch to root to install system and python packages
USER root

# Install Node.js, npm, and Python dependencies
RUN apt-get update -y && \
    apt-get install -y nodejs npm && \
    pip install --no-cache-dir -r requirements.txt

# Copy all project files
COPY . .

# Install npm dependencies (for concurrently)
RUN npm install

# Switch back to the non-privileged user for security
USER 1001

# Command to run both servers
CMD ["npm", "start"]