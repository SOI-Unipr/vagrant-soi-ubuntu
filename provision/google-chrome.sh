#!/bin/bash

pkg=google-chrome-stable
inst=$(dpkg-query --show --showformat='${db:Status-Status}\n' "$pkg")

if ! [ "$inst" = "installed" ]; then
    curl -fsSL https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    echo "deb https://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google.list
    sudo apt-get update
    sudo DEBIAN_FRONTEND=noninteractive apt-get -y install "$pkg"
fi

