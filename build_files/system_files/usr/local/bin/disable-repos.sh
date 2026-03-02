#!/bin/bash

# Disable repositories
dnf config-manager --set-disabled baseos
dnf config-manager --set-disabled appstream
dnf config-manager --set-disabled crb
dnf config-manager --set-disabled extras-common
dnf config-manager --set-disabled epel
dnf config-manager --set-disabled copr:copr.fedorainfracloud.org:sassam:trilliumOS

# Fix tuned-ppd failing due to SELinux 
restorecon -rv /var/log
systemctl restart tuned-ppd.service

# Ensuring it only runs once by disabling this service
systemctl disable disable-repos.service