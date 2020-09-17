#!/bin/bash

inst=$(dpkg-query --show --showformat='${db:Status-Status}\n' 'code')

if ! [ "$inst" = "installed" ]; then
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    sudo DEBIAN_FRONTEND=noninteractive add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    sudo DEBIAN_FRONTEND=noninteractive apt-get update
    sudo DEBIAN_FRONTEND=noninteractive apt-get -y install code
fi
