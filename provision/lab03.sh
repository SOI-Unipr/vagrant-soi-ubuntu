#!/bin/bash

DOC_ROOT=/var/www/lab03
if ! [ -d $DOC_ROOT ]; then
    mkdir $DOC_ROOT
    cp -r /vagrant/labs/lab03/* $DOC_ROOT/
    cp /vagrant/labs/lab03/.htaccess $DOC_ROOT/
fi

if ! grep soi-lab03 /etc/hosts &> /dev/null; then
    echo "127.0.0.1       soi-lab03 www.soi-lab03 lab03.soi" | sudo tee -a /etc/hosts
fi

if ! [ -f /etc/apache2/sites-available/lab03.conf ]; then
    sudo cp /vagrant/provision/lab03-apache.conf /etc/apache2/sites-available/lab03.conf
    sudo a2ensite lab03
    sudo systemctl reload apache2
fi
