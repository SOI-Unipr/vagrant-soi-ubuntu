#!/bin/sh
sudo apt-get install -y apache2 
# install bootstrap example
cd /var/www/
sudo wget https://github.com/twbs/bootstrap/releases/download/v4.5.2/bootstrap-4.5.2-examples.zip
sudo unzip bootstrap-4.5.2-examples.zip
sudo mv bootstrap-4.5.2-examples bootstrap-examples
sudo rm -rf bootstrap-examples/bootstrap-4.5.2-examples
sudo rm bootstrap-4.5.2-examples.zip
sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/bootstrap-example.conf

sudo sed 's/DocumentRoot \/var\/www\/html/DocumentRoot \/var\/www\/bootstrap-examples/' /etc/apache2/sites-available/bootstrap-example.conf>/tmp/bootstrap-example.conf
sudo sed 's/#ServerName www.example.com/ServerName soi-lab02/' /tmp/bootstrap-example.conf>/tmp/bootstrap-example.conf.2   
sudo cp /tmp/bootstrap-example.conf.2 /etc/apache2/sites-available/bootstrap-example.conf

sudo echo "# custom configuration"|sudo tee -a /etc/hosts
sudo echo "127.0.0.1       soi-lab02"|sudo tee -a /etc/hosts

sudo systemctl restart apache2