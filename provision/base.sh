#!/bin/bash

echo "$(whoami):$(whoami)" | sudo chpasswd

inst=$(dpkg-query --show --showformat='${db:Status-Status}\n' 'zip')

if ! [ "$inst" = "installed" ]; then
    sudo DEBIAN_FRONTEND=noninteractive apt-get update
    sudo DEBIAN_FRONTEND=noninteractive apt-get -y upgrade

    sudo DEBIAN_FRONTEND=noninteractive apt-get -y install \
         apt-transport-https \
         bzip2 \
         ca-certificates \
         coreutils \
         curl \
         gzip \
         lsb-release \
         man-db \
         patch \
         python-apt \
         python-pycurl \
         sed \
         software-properties-common \
         tar \
         unzip \
         wget \
         zip 
fi
