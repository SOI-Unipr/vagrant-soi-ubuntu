#!/bin/sh

sudo DEBIAN_FRONTEND=noninteractive apt-get -y install lubuntu-desktop
#sudo DEBIAN_FRONTEND=noninteractive apt-get -y install virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
sudo VBoxClient --checkhostversion
sudo VBoxClient --clipboard
#sudo VBoxClient --display
sudo VBoxClient --draganddrop
sudo VBoxClient --seamless
