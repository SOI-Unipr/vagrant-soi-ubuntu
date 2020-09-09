#!/bin/sh

if ! grep 'XKBLAYOUT="it"' /etc/default/keyboard > /dev/null; then
    sudo sed -i 's/XKBLAYOUT="us"/XKBLAYOUT="it"/' /etc/default/keyboard
fi

