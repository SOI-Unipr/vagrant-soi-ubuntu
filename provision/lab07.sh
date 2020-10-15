#!/bin/bash

if ! grep soi-lab07 /etc/hosts &> /dev/null; then
    echo "127.0.0.1       soi-lab07 www.soi-lab07 lab07.soi" | sudo tee -a /etc/hosts
fi

[ -d $HOME/Projects ] || mkdir $HOME/Projects

if ! [ -d $HOME/Projects/lab07 ]; then
    cp -r /vagrant/labs/lab07 $HOME/Projects/lab07
fi
