#!/bin/bash
set -ex

# make working dir
mkdir install_dir
cd install_dir

# Install dependency (Ubuntu)
sudo apt install curl

# downlaod custom debs
curl -O http://elevatedsystems.tech/media/scripts/libfprint_v1.94.1-2_debs.zip

# unzip archive
unzip ./libfprint_v1.94.1-2_debs.zip

# install one dependency
sudo apt install -y gir1.2-gusb-1.0

# install .deb files
cd fprintd
sudo dpkg -i ../*.deb
sudo dpkg -i ./*.deb

# enable service
sudo systemctl enable fprintd.service
sudo systemctl start fprintd.service

# enable pam module (sudo functionality)
sudo pam-auth-update --enable fprintd

# delete working dir
cd ..
cd ..
sudo rm -rf install_dir