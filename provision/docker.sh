#!/bin/bash

pkg=docker-ce
inst=$(dpkg-query --show --showformat='${db:Status-Status}\n' "$pkg")

if ! [ "$inst" = "installed" ]; then
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

    sudo apt-get update

    sudo DEBIAN_FRONTEND=noninteractive apt-get -y install \
         docker-ce \
         docker-ce-cli \
         containerd.io

    sudo systemctl start docker
    sudo systemctl enable docker
    sudo usermod -a -G docker $(whoami)
fi

dc_path=/usr/local/bin/docker-compose
if ! [ -f "$dc_path" ]; then
    sudo curl -fsSL "https://github.com/docker/compose/releases/download/1.27.3/docker-compose-$(uname -s)-$(uname -m)" -o "$dc_path"
    sudo chmod +x "$dc_path"
fi
