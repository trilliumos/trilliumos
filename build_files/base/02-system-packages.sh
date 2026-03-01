#!/usr/bin/bash

ARCH=$(uname -m)

# Install required packages for trilliumOS image
dnf group install -y \
    "Server with GUI" \
    "Dial-up Networking Support" \
    "Hardware Support" \
    "Anaconda tools" \
    "Core" \
    "Fonts" \
    "GNOME" \
    "Guest Agents" \
    "Guest Desktop Agents" \
    "System Tools" \
    "Graphical Administration Tools" \
    "Input Methods" \
    "Multimedia" \
    "Common NetworkManager submodules" \
    "Standard" \
    "Virtualization Hypervisor" \
    "Container Management" \
    "Printing Client" \
    "Hardware Monitoring Utilities" \
    "Image based rpm-ostree support"

dnf install -y \
    btrfs-progs \
    gnome-tweaks \
    distrobox \
    vim-enhanced \
    samba \
    ntfs-3g \
    ntfsprogs \
    fuse-sshfs \
    git \
    ffmpeg-free \
    flac \
    faad2 \
    lame \
    libmad \
    vorbis-tools \
    gnome-shell-extension-dash-to-panel \
    gnome-shell-extension-appindicator \
    gnome-shell-extension-desktop-icons-ng \
    gnome-shell-extension-gsconnect \
    gnome-shell-extension-arcmenu \
    gnome-shell-extension-blur-my-shell \
    dnf-bootc \
    ostree \
    rpm-ostree

# Install Intel packages to optimize CPU & hardware
if [[ $ARCH == "x86_64" || $ARCH == "amd64" ]]; then
    dnf install -y \
        microcode_ctl \
        libva-intel-media-driver \
        intel-gmmlib \
        intel-vsc-firmware
else
    dnf install -y widevine-installer \
        chromium
fi

# Remove unwanted packages
dnf remove -y subscription-manager \
	setroubleshoot \
    gnome-extensions-app \
    firefox \
    firefox-langpacks \
    gnome-shell-extension-background-logo \
    toolbox \
    papers \
    gnome-calculator \
    gnome-remote-desktop \
    gnome-characters \
    gnome-clocks \
    baobab \
    gnome-font-viewer

# Replace distro-based logo with custom
rpm --erase --nodeps centos-logos
dnf -y install trilliumos-logos

# Install nerd-fonts
dnf -y copr enable che/nerd-fonts "centos-stream-10-$(arch)"
dnf -y copr disable che/nerd-fonts
dnf -y --enablerepo "copr:copr.fedorainfracloud.org:che:nerd-fonts" install \
	nerd-fonts

# Version lock critical packages (i.e. kernel & gnome)
dnf versionlock add kernel*6.18.0-65* \
    gnome-shell-49.4*
