FROM node:20-slim

RUN useradd --create-home mirror
USER mirror

# Not supposed to be changed, defined for covenience
ENV CORESTORE=/home/mirror/data/store
ENV KEYLOC=/home/mirror/data/drivekey.txt
ENV DIR=/home/mirror/publish

RUN mkdir -p $CORESTORE

COPY node_modules /home/mirror/node_modules
COPY package-lock.json /home/mirror/
COPY package.json /home/mirror/
COPY LICENSE /home/mirror/
COPY NOTICE /home/mirror/
COPY run.sh /home/mirror/

WORKDIR /home/mirror

ENTRYPOINT ["./run.sh"]
