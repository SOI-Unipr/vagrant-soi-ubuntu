#!/bin/bash

pkg=python3-pip
inst=$(dpkg-query --show --showformat='${db:Status-Status}\n' "$pkg")

if ! [ "$inst" = "installed" ]; then
    sudo DEBIAN_FRONTEND=noninteractive apt-get -y install "$pkg"
fi

if ! [ -e $HOME/.local/bin/http ] ; then
    export PATH="$PATH:$HOME/.local/bin"
    pip3 install --user httpie
fi

