#!/bin/sh

# copy bootstrap example
if ! [ -d /var/www/bootstrap-examples ]; then
    cd /var/www/
    wget https://github.com/twbs/bootstrap/releases/download/v4.5.2/bootstrap-4.5.2-examples.zip
    unzip bootstrap-4.5.2-examples.zip
    mv bootstrap-4.5.2-examples bootstrap-examples
    rm -rf bootstrap-examples/bootstrap-4.5.2-examples
    rm bootstrap-4.5.2-examples.zip
fi

# copy chrome devtools examples
if ! [ -d /var/www/devtools-samples ]; then
    cd /var/www
    wget https://github.com/GoogleChrome/devtools-samples/archive/master.zip
    unzip master.zip
    mv devtools-samples-master devtools-samples
    rm -rf devtools-samples/devtools-samples-master
    rm master.zip
fi

# copy exercies
if ! [ -d /var/www/devtools-samples/memleak ]; then
    cd /var/www/devtools-samples/
    mkdir memleak
    cp /vagrant/labs/lab02/memleak1.html memleak/
    cp /vagrant/labs/lab02/memleak2.html memleak/
fi

# remove default dir
[ -d /var/www/html ] && sudo rm -rf /var/www/html

# enable new site
if ! [ -f /etc/apache2/sites-available/001-lab02.conf ]; then
    sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/default.conf
    sudo sed 's/DocumentRoot \/var\/www\/html/DocumentRoot \/var\/www/' /etc/apache2/sites-available/default.conf > /tmp/default.conf
    sudo sed 's/#ServerName www.example.com/ServerName soi-lab02/' /tmp/default.conf > /tmp/default.2
    sudo cp /tmp/default.2 /etc/apache2/sites-available/001-lab02.conf

    echo "\n# custom configuration" | sudo tee -a /etc/hosts
    echo "127.0.0.1       soi-lab02" | sudo tee -a /etc/hosts

    sudo a2dissite 000-default.conf
    sudo a2ensite 001-lab02.conf

    sudo systemctl reload apache2
fi
