#!/usr/bin/bash

set -eoux pipefail

ARCH=$(uname -m)

# Make /usr/local writeable
mv /usr/local /var/usrlocal
ln -s /var/usrlocal /usr/local

# Makes `/opt` writeable by default
mv /opt /var/opt
ln -s /var/opt /opt

# Enable EPEL, CRB, Flathub, & COPR Repos
dnf install -y epel-release && \
dnf config-manager --set-enabled crb && \
dnf copr enable -y sassam/trilliumOS

dnf update -y

dnf install -y python3-dnf-plugin-versionlock

#### FUTURE TODO - SETUP SECUREBOOT ####
# Add akmods secureboot key
# mkdir -p /etc/pki/akmods/certs
# curl --retry 15 -Lo /etc/pki/akmods/certs/akmods-ublue.der "https://github.com/ublue-os/akmods/raw/main/certs/public_key.der"