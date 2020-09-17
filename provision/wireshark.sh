#!/bin/bash


inst=$(dpkg-query --show --showformat='${db:Status-Status}\n' 'wireshark')

if ! [ "$inst" = "installed" ]; then
    sudo DEBIAN_FRONTEND=noninteractive apt-get -y install wireshark
    yes | sudo dpkg-reconfigure -f teletype wireshark-common
    sudo usermod -a -G wireshark vagrant
fi
