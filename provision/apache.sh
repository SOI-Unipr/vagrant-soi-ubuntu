#!/bin/sh
sudo apt-get install -y apache2 
# copy bootstrap example
cd /var/www/
sudo wget https://github.com/twbs/bootstrap/releases/download/v4.5.2/bootstrap-4.5.2-examples.zip
sudo unzip bootstrap-4.5.2-examples.zip
sudo mv bootstrap-4.5.2-examples bootstrap-examples
sudo rm -rf bootstrap-examples/bootstrap-4.5.2-examples
sudo rm bootstrap-4.5.2-examples.zip

# copy chrome devtools examples
sudo wget https://github.com/GoogleChrome/devtools-samples/archive/master.zip
sudo unzip master.zip
sudo mv devtools-samples-master devtools-samples
sudo rm -rf devtools-samples/devtools-samples-master
sudo rm master.zip
sudo rm -rf html

cd /var/www/devtools-samples
sudo mkdir memleak
cd memleak

sudo wget sudo wget https://raw.githubusercontent.com/danieleporta/vagrant-soi-ubuntu/master/share/memleak1.html
sudo wget sudo wget https://raw.githubusercontent.com/danieleporta/vagrant-soi-ubuntu/master/share/memleak2.html

#enable new site
sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/default.conf
sudo sed 's/DocumentRoot \/var\/www\/html/DocumentRoot \/var\/www/' /etc/apache2/sites-available/default.conf>/tmp/default.conf
sudo sed 's/#ServerName www.example.com/ServerName soi-lab02/' /tmp/default.conf>/tmp/default.2   
sudo cp /tmp/default.2 /etc/apache2/sites-available/default.conf


sudo echo "# custom configuration"|sudo tee -a /etc/hosts
sudo echo "127.0.0.1       soi-lab02"|sudo tee -a /etc/hosts

sudo a2dissite 000-default.conf 
sudo a2ensite default.conf

sudo systemctl reload apache2