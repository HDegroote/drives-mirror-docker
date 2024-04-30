#!/usr/bin/env bash

DRIVES_CMD="./node_modules/.bin/drives"

[ ! -f $KEYLOC ] && echo "No key found, creating a new one" && ./node_modules/.bin/drives touch . --storage $CORESTORE | tail -n 1 | awk '{print $3}' > $KEYLOC

# Needs exec so it forwards signal
echo "Drive public key: $(cat $KEYLOC)" &&\
exec ./node_modules/.bin/drives mirror /home/mirror/publish $(cat $KEYLOC) --live --storage $CORESTORE --filter .+.swp

