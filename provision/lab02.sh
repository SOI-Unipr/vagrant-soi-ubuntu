#!/bin/bash

DOC_ROOT=/var/www/lab02
[ -d $DOC_ROOT ] || mkdir $DOC_ROOT

# copy bootstrap example
if ! [ -d $DOC_ROOT/bootstrap-examples ]; then
    cd $DOC_ROOT/
    wget -q https://github.com/twbs/bootstrap/releases/download/v4.5.2/bootstrap-4.5.2-examples.zip
    unzip bootstrap-4.5.2-examples.zip
    mv bootstrap-4.5.2-examples bootstrap-examples
    rm -rf bootstrap-examples/bootstrap-4.5.2-examples
    rm bootstrap-4.5.2-examples.zip
fi

# copy chrome devtools examples
if ! [ -d $DOC_ROOT/devtools-samples ]; then
    cd $DOC_ROOT
    wget -q https://github.com/GoogleChrome/devtools-samples/archive/master.zip
    unzip master.zip
    mv devtools-samples-master devtools-samples
    rm -rf devtools-samples/devtools-samples-master
    rm master.zip
fi

# copy exercies
if ! [ -d $DOC_ROOT/devtools-samples/memleak ]; then
    cd $DOC_ROOT/devtools-samples/
    mkdir memleak
    cp /vagrant/labs/lab02/memleak1.html memleak/
    cp /vagrant/labs/lab02/memleak2.html memleak/
fi

# remove default dir
[ -d /var/www/html ] && sudo rm -rf /var/www/html

# enable host resolution
if ! grep soi-lab02 /etc/hosts &> /dev/null; then
    echo "\n# custom configuration" | sudo tee -a /etc/hosts
    echo "127.0.0.1       soi-lab02" | sudo tee -a /etc/hosts
fi

# enable new site
if ! [ -f /etc/apache2/sites-available/lab02.conf ]; then
    sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/lab02.conf
    sudo sed -i 's%DocumentRoot /var/www/html%DocumentRoot /var/www/lab02%' /etc/apache2/sites-available/lab02.conf
    sudo sed -i 's/#ServerName www.example.com/ServerName soi-lab02/' /etc/apache2/sites-available/lab02.conf

    sudo a2dissite 000-default.conf
    sudo a2ensite lab02
    sudo systemctl reload apache2
fi
