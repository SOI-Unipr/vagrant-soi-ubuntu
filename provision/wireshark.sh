#!/bin/bash

pkg=wireshark
inst=$(dpkg-query --show --showformat='${db:Status-Status}\n' "$pkg")

if ! [ "$inst" = "installed" ]; then
    sudo DEBIAN_FRONTEND=noninteractive apt-get -y install "$pkg"
    yes | sudo dpkg-reconfigure -f teletype wireshark-common
    sudo usermod -a -G wireshark $(whoami)
fi
