#!/bin/sh


inst=$(dpkg-query --show --showformat='${db:Status-Status}\n' 'wireshark')

if ! [ "$inst" = "installed" ]; then
    sudo DEBIAN_FRONTEND=noninteractive apt-get -y install wireshark
fi
