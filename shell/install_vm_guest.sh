#!/bin/bash

# Install VirtualBox guest additions
sudo yum install -y linux-headers-$(uname -r) build-essentials dkms
sudo mount /dev/sr0 /mnt
sudo sh /media/cdrom/VBoxLinuxAdditions.run
