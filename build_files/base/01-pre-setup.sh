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

dnf install -y python3-dnf-plugin-versionlock

# Kernel Swap - Install kernel

KERNEL_NAME="kernel"

# Remove existing kernel packages
PKGS=( "${KERNEL_NAME}" "${KERNEL_NAME}-core" "${KERNEL_NAME}-modules" "${KERNEL_NAME}-modules-core" "${KERNEL_NAME}-modules-extra" "${KERNEL_NAME}-uki-virt" )
for pkg in "${PKGS[@]}"; do
  rpm --erase "$pkg" --nodeps || true
done

INSTALL_PKGS=( "${KERNEL_NAME}" "${KERNEL_NAME}-core" "${KERNEL_NAME}-modules" "${KERNEL_NAME}-modules-core" "${KERNEL_NAME}-modules-extra" "${KERNEL_NAME}-uki-virt" "${KERNEL_NAME}-devel" "${KERNEL_NAME}-devel-matched" )

for instpkg in "${INSTALL_PKGS[@]}"; do
  dnf -y install "$instpkg"
done

# /*
### Version Lock kernel packages
# */
dnf versionlock add \
  "$KERNEL_NAME" \
  "$KERNEL_NAME"-core \
  "$KERNEL_NAME"-modules \
  "$KERNEL_NAME"-modules-core \
  "$KERNEL_NAME"-modules-extra

#### FUTURE TODO - SETUP SECUREBOOT ####
# Add akmods secureboot key
# mkdir -p /etc/pki/akmods/certs
# curl --retry 15 -Lo /etc/pki/akmods/certs/akmods-ublue.der "https://github.com/ublue-os/akmods/raw/main/certs/public_key.der"