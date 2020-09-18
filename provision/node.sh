#!/bin/bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

if ! command node -v > /dev/null; then
    nvm install --lts --no-progress --latest-npm
fi
