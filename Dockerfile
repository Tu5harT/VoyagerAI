# Final Dockerfile for Replit/Railway Single Service
FROM rasa/rasa:3.6.10

WORKDIR /app
COPY . /app

USER root
RUN apt-get update -y && apt-get install -y nodejs npm
RUN pip install --no-cache-dir -r requirements.txt
RUN npm install
USER 1001

# Override the base image's entrypoint to use npm
ENTRYPOINT ["/usr/bin/npm"]
CMD ["start"]