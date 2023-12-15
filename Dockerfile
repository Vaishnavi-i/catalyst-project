FROM httpd:latest

RUN mkdir node
COPY . ./node
WORKDIR ./node/

RUN apt-get update
RUN apt-get install npm -y

EXPOSE 1337

CMD node server.js
