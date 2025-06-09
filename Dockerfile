# Final Dockerfile for public image

FROM rasa/rasa:3.6.10

WORKDIR /app
COPY . /app

USER root
RUN apt-get update -y && apt-get install -y nodejs npm
RUN pip install --no-cache-dir -r requirements.txt
RUN npm install
USER 1001

ENTRYPOINT ["/usr/bin/npm"]
CMD [ "start" ]