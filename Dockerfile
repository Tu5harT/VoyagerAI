# Final Single-Service Dockerfile v2

# Start from the base Rasa image
FROM rasa/rasa:3.6.10

# Set working directory
WORKDIR /app

# Copy all project files
COPY . /app

# Switch to the root user to install packages
USER root

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Switch back to the non-privileged user
USER 1001

# Command to run Rasa, which will auto-start the action server
CMD ["run", "--enable-api", "--cors", "*", "-p", "10000", "--debug"]