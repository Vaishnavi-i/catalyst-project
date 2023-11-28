FROM artifactory-docker-registry.cto.veritas.com/httpd:latest

RUN mkdir node
COPY . ./node
WORKDIR ./node/

RUN apt-get update
RUN apt-get install npm -y

EXPOSE 8080

CMD node server.js
