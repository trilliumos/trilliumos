#!/usr/bin/bash

set -eoux pipefail

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

if [[ $ARCH == "x86_64" || $ARCH == "amd64" ]]; then
    rpm --import https://dl.google.com/linux/linux_signing_key.pub
    echo -e "[google-chrome]\\nname=google-chrome\\nbaseurl=baseurl=https://dl.google.com/linux/chrome/rpm/stable/x86_64\\nenabled=1\\ngpgcheck=1\\ngpgkey=https://dl.google.com/linux/linux_signing_key.pub" | sudo tee /etc/yum.repos.d/google-chrome.repo > /dev/null
fi

# Add Visual Studio Code Repo
rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\\nname=Visual Studio Code\\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\\nenabled=1\\nautorefresh=1\\ntype=rpm-md\\ngpgcheck=1\\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null

dnf update -y

dnf install -y python3-dnf-plugin-versionlock

#### FUTURE TODO - SETUP SECUREBOOT ####
# Add akmods secureboot key
# mkdir -p /etc/pki/akmods/certs
# curl --retry 15 -Lo /etc/pki/akmods/certs/akmods-ublue.der "https://github.com/ublue-os/akmods/raw/main/certs/public_key.der"