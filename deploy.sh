#!/bin/bash

set -e

# Remove files
REMOTE_PATH=/var/www/html/bms_public_site
OUT=.
CONNECTION=tester@217.70.189.97

echo -e "Cleaning destination..."
CMD="mkdir -p ${REMOTE_PATH} && cd ${REMOTE_PATH} && rm -rf *"
ssh -oStrictHostKeyChecking=no -o PubkeyAuthentication=yes $CONNECTION "$CMD"

echo -e "Synchronizing files..."
scp -o stricthostkeychecking=no -o PubkeyAuthentication=yes -r $OUT/* $CONNECTION:$REMOTE_PATH

echo -e "Deployed!!"