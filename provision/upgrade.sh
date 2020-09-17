#!/bin/bash

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade
sudo DEBIAN_FRONTEND=noninteractive apt-get -y autoclean
