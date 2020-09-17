#!/bin/bash

DOC_ROOT=/var/www/lab06
if ! [ -d $DOC_ROOT ]; then
    mkdir $DOC_ROOT
    cp -r /vagrant/labs/lab06/* $DOC_ROOT/
    cp /vagrant/labs/lab06/.htaccess $DOC_ROOT/
fi

if ! grep soi-lab06 /etc/hosts &> /dev/null; then
    echo "127.0.0.1       soi-lab06 www.soi-lab06 lab06.soi" | sudo tee -a /etc/hosts
fi

if ! [ -f /etc/apache2/sites-available/lab06.conf ]; then
    sudo cp /vagrant/provision/lab06-apache.conf /etc/apache2/sites-available/lab06.conf
    sudo a2enmod proxy_http rewrite proxy expires
    sudo a2ensite lab06
    # restart required for modules to take effect
    sudo systemctl restart apache2
fi

[ -d $HOME/Projects ] || mkdir $HOME/Projects

if ! [ -d $HOME/Projects/lab06 ]; then
    cp -r /vagrant/labs/lab06-server $HOME/Projects/lab06
    cd $HOME/Projects/lab06
    export NVM_DIR="$HOME/.nvm"
    source "$NVM_DIR/nvm.sh"
    npm install
fi
