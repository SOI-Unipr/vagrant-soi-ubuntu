#!/bin/sh
#setxkbmap it
sudo cp /etc/default/keyboard /etc/default/keyboard.old
sudo sed 's/XKBLAYOUT="us"/XKBLAYOUT="it"/' /etc/default/keyboard > /tmp/keyboard.new
sudo cp /tmp/keyboard.new /etc/default/keyboard
