#!/bin/sh

inst=$(dpkg-query --show --showformat='${db:Status-Status}\n' 'lubuntu-desktop')

if ! [ "$inst" = "installed" ]; then
    sudo DEBIAN_FRONTEND=noninteractive apt-get -y install lubuntu-desktop
    #sudo DEBIAN_FRONTEND=noninteractive apt-get -y install virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
    sudo VBoxClient --checkhostversion
    sudo VBoxClient --clipboard
    #sudo VBoxClient --display
    sudo VBoxClient --draganddrop
    sudo VBoxClient --seamless
fi

# make unipr log the official face of the user
cp /vagrant/provision/unipr.png ~/.face

# make sure Lubuntu is the default session for vagrant user
sudo cp /vagrant/provision/vagrant-account-service.desktop /var/lib/AccountsService/users/vagrant
sudo chmod 600 /var/lib/AccountsService/users/vagrant

