#!/usr/bin/bash

#### Final configurations

# Disable RHEL flatpak repo
flatpak remote-delete rhel

# Add Flathub
mkdir -p /etc/flatpak/remotes.d
curl --retry 3 -o /etc/flatpak/remotes.d/flathub.flatpakrepo "https://dl.flathub.org/repo/flathub.flatpakrepo"

# Add release background
rsync -rvK /ctx/system_files/usr/share/backgrounds/ /usr/share/backgrounds/
rsync -rvK /ctx/system_files/usr/share/gnome-background-properties/ /usr/share/gnome-background-properties/

# Add FedoraWorkstation firewalld profile (courtesy of Bluefin)
# https://src.fedoraproject.org/rpms/firewalld/blob/rawhide/f/firewalld.spec
curl -fsSLo /usr/lib/firewalld/zones/FedoraWorkstation.xml "https://src.fedoraproject.org/rpms/firewalld/raw/rawhide/f/FedoraWorkstation.xml"
grep -F -e '<port protocol="udp" port="1025-65535"/>' /usr/lib/firewalld/zones/FedoraWorkstation.xml

# https://src.fedoraproject.org/rpms/firewalld/blob/rawhide/f/firewalld.spec#_178
sed -i 's|^DefaultZone=.*|DefaultZone=FedoraWorkstation|g' /etc/firewalld/firewalld.conf
sed -i 's|^IPv6_rpfilter=.*|IPv6_rpfilter=loose|g' /etc/firewalld/firewalld.conf
grep -F -e "DefaultZone=FedoraWorkstation" /etc/firewalld/firewalld.conf
grep -F -e "IPv6_rpfilter=loose" /etc/firewalld/firewalld.conf

# System services
systemctl enable smb nmb
systemctl enable bootc-fetch-apply-updates.timer
systemctl mask rpm-ostree-countme.timer rpm-ostree-countme.service

# Disable lastlog display on previous failed login in GDM (This makes logins slow)
authselect enable-feature with-silent-lastlog

# Enable polkit rules for fingerprint sensors via fprintd
authselect enable-feature with-fingerprint

# Cleanup DNF
dnf clean all && \
    rm -rf /var/cache/dnf

# Copy script and services to disable DNF repos on first boot
rsync -rvK /ctx/system_files/usr/local/bin/ /usr/local/bin/
rsync -rvK /ctx/system_files/etc/systemd/system/ /etc/systemd/system/
systemctl enable disable-repos.service