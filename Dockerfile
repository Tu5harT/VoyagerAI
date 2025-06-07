# Final Single-Service Dockerfile

FROM rasa/rasa:3.6.10

WORKDIR /app

# Copy requirements and install them as root to avoid permission errors
COPY requirements.txt .
USER root
RUN pip install -r requirements.txt

# Switch back to the non-privileged user
USER 1001

# Copy the rest of your project files
COPY . .

# Command to run our custom server startup script
CMD ["python", "-m", "app"]