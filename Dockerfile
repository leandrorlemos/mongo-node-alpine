FROM node:8.9.2-alpine

MAINTAINER Leandro Lemos <leandrorlemos@gmail.com>

RUN \
apk add --no-cache mongodb && \
rm /usr/bin/mongoperf

# node application
ENV HOME=/app
ADD . $HOME
WORKDIR $HOME
RUN npm install

# mongo
VOLUME /data/db
EXPOSE 27017 27017
# RUN ./mongo.sh

# ENTRYPOINT mongod --fork --logpath /var/log/mongod.log && npm start