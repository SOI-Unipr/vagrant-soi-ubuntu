#!/bin/bash

[ -d $HOME/Projects ] || mkdir $HOME/Projects

if ! [ -d $HOME/Projects/lab05 ]; then
    cp -r /vagrant/labs/lab05 $HOME/Projects/
    cd $HOME/Projects/lab05
    export NVM_DIR="$HOME/.nvm"
    source "$NVM_DIR/nvm.sh"
    npm install
fi
