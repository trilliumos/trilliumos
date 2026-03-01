#!/usr/bin/bash

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo && \
flatpak install --system -y --noninteractive flathub \
    com.mattjakeman.ExtensionManager \
    org.gnome.Calendar \
    org.gnome.Snapshot \
    org.gnome.Connections \
    org.gnome.Contacts \
    org.gnome.Maps \
    org.gnome.Papers \
    org.gnome.Calculator \
    org.gnome.Connections \
    org.gnome.Characters \
    org.gnome.clocks \
    org.gnome.baobab \
    org.gnome.font-viewer \
    org.gnome.Loupe \
    org.gnome.Weather \
    com.borgbase.Vorta \
    org.gnome.Chess \
    org.gnome.Sudoku \
    org.gnome.Firmware \
    org.gnome.Evolution \
    org.gnome.Music \
    io.github.celluloid_player.Celluloid