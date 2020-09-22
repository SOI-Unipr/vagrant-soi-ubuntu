![](logo.png)

# SOI Ubuntu 20.04

This is the Vagrant project to setup a virtual machine for the course "Sistemi Orientati ad Internet"
at the University of Parma in 2020/2021.

## Installation

Prerequisites:

* [VirtualBox](https://www.virtualbox.org/wiki/Downloads). This has been tested with version 5.1.20
* [Vagrant](https://vagrantup.com/downloads.html). This has been tested using version 1.9.4

Clone this repository, then from the repository folder run this command:

    vagrant up && vagrant reload

The `vagrant` user password is `vagrant`.

## Notes

* If Wireshark requires root privileges to be run, please execute the following caommands:

    ```
    sudo dpkg-reconfigure wireshark-common
    sudo usermod -a -G wireshark vagrant
    ```
