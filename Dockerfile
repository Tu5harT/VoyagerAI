# The simplest possible Dockerfile
FROM rasa/rasa:3.6.10
WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt
CMD ["run", "--enable-api", "--cors", "*", "-p", "10000", "--debug"]