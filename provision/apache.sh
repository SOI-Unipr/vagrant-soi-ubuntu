#!/bin/bash

pkg=apache2
inst=$(dpkg-query --show --showformat='${db:Status-Status}\n' "$pkg")

if ! [ "$inst" = "installed" ]; then
    sudo apt-get install -y "$pkg"
    sudo usermod -a -G www-data $(whoami)
    sudo chown :www-data /var/www
    sudo chmod g+sw /var/www
fi
