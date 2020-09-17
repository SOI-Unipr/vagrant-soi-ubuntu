#!/bin/bash

inst=$(dpkg-query --show --showformat='${db:Status-Status}\n' 'apache2')

if ! [ "$inst" = "installed" ]; then
    sudo apt-get install -y apache2
    sudo usermod -a -G www-data vagrant
    sudo chown :www-data /var/www
    sudo chmod g+sw /var/www
fi
