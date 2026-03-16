#!/usr/bin/bash

set -eoux pipefail

rsync -rvK /ctx/system_files/usr/share/backgrounds/ /usr/share/backgrounds/
rsync -rvK /ctx/system_files/usr/share/gnome-background-properties/ /usr/share/gnome-background-properties/

tee /etc/dconf/db/local.d/01-trilliumos-defaults << EOF
[Profiles/9559f421ac4e8a13a3e958c2695b07f2]
palette='dracula'

[org.gnome.desktop.background]
picture-uri='file:///usr/share/backgrounds/jasper.jpg'
picture-uri-dark='file:///usr/share/backgrounds/jasper.jpg'

[org/gnome/Ptyxis]
default-columns=uint32 86
default-profile-uuid='9559f421ac4e8a13a3e958c2695b07f2'
font-name='Red Hat Mono Medium 12 @wght=500'
interface-style='dark'
profile-uuids=['9559f421ac4e8a13a3e958c2695b07f2']
restore-session=true
restore-window-size=false
use-system-font=false
window-size=(uint32 84, uint32 20)

[org/gnome/Ptyxis/Profiles/9559f421ac4e8a13a3e958c2695b07f2]
palette='dracula'

[org/gnome/TextEditor]
custom-font='Red Hat Mono Medium 12 @wght=500'
show-line-numbers=true
use-system-font=false

[org/gnome/control-center]
last-panel='power'
window-state=(980, 640, false)

[org/gnome/desktop/app-folders]
folder-children=['System', 'Utilities', 'YaST', 'Pardus']

[org/gnome/desktop/app-folders/folders/25b2a5c6-8780-431c-92f0-d5d67f176213]
apps=['org.libreoffice.LibreOffice.math.desktop', 'org.libreoffice.LibreOffice.writer.desktop', 'org.libreoffice.LibreOffice.impress.desktop', 'org.libreoffice.LibreOffice.draw.desktop', 'org.libreoffice.LibreOffice.calc.desktop', 'org.libreoffice.LibreOffice.base.desktop', 'org.libreoffice.LibreOffice.desktop']
name='Office'

[org/gnome/desktop/app-folders/folders/3d84f748-7f5d-4c7e-acc7-37ecf4a20661]
apps=['audacious.desktop', 'vlc.desktop']
name='Multimedia'
translate=false

[org/gnome/desktop/app-folders/folders/Pardus]
categories=['X-Pardus-Apps']
name='X-Pardus-Apps.directory'
translate=true

[org/gnome/desktop/app-folders/folders/System]
apps=['org.gnome.baobab.desktop', 'org.gnome.DiskUtility.desktop', 'org.gnome.SystemMonitor.desktop', 'org.gnome.tweaks.desktop']
name='X-GNOME-Shell-System.directory'
translate=true

[org/gnome/desktop/app-folders/folders/Utilities]
apps=['org.gnome.Connections.desktop', 'org.gnome.Papers.desktop', 'org.gnome.font-viewer.desktop', 'org.gnome.Loupe.desktop']
name='X-GNOME-Shell-Utilities.directory'
translate=true

[org/gnome/desktop/app-folders/folders/YaST]
categories=['X-SuSE-YaST']
name='suse-yast.directory'
translate=true

[org/gnome/desktop/app-folders/folders/deb2123b-6af4-4a31-9de1-2d32540aa9c0]
apps=['org.gnome.Sudoku.desktop', 'org.gnome.Chess.desktop']
name='Games'

[org/gnome/desktop/background]
color-shading-type='solid'
picture-options='zoom'
picture-uri='file:///usr/share/backgrounds/jasper.jpg'
picture-uri-dark='file:///usr/share/backgrounds/jasper.jpg'
primary-color='#a14f8c'
secondary-color='#200735'

[org/gnome/desktop/calendar]
show-weekdate=true

[org/gnome/desktop/input-sources]
current=uint32 0
sources=[('xkb', 'us')]

[org/gnome/desktop/interface]
clock-format='12h'
clock-show-weekday=true
enable-animations=true
enable-hot-corners=false
icon-theme='Adwaita'

[org/gnome/desktop/notifications]
application-children=['org-gnome-ptyxis', 'org-gnome-software', 'gnome-power-panel', 'gnome-about-panel', 'org-gnome-characters', 'org-gnome-nautilus', 'org-gnome-rhythmbox3', 'org-mozilla-firefox', 'org-gnome-texteditor', 'com-mattjakeman-extensionmanager']

[org/gnome/desktop/notifications/application/com-mattjakeman-extensionmanager]
application-id='com.mattjakeman.ExtensionManager.desktop'

[org/gnome/desktop/notifications/application/gnome-about-panel]
application-id='gnome-about-panel.desktop'

[org/gnome/desktop/notifications/application/gnome-power-panel]
application-id='gnome-power-panel.desktop'

[org/gnome/desktop/notifications/application/org-gnome-characters]
application-id='org.gnome.Characters.desktop'

[org/gnome/desktop/notifications/application/org-gnome-nautilus]
application-id='org.gnome.Nautilus.desktop'

[org/gnome/desktop/notifications/application/org-gnome-ptyxis]
application-id='org.gnome.Ptyxis.desktop'

[org/gnome/desktop/notifications/application/org-gnome-rhythmbox3]
application-id='org.gnome.Rhythmbox3.desktop'

[org/gnome/desktop/notifications/application/org-gnome-software]
application-id='org.gnome.Software.desktop'

[org/gnome/desktop/notifications/application/org-gnome-texteditor]
application-id='org.gnome.TextEditor.desktop'

[org/gnome/desktop/notifications/application/org-mozilla-firefox]
application-id='org.mozilla.firefox.desktop'

[org/gnome/desktop/privacy]
report-technical-problems=false

[org/gnome/desktop/screensaver]
color-shading-type='solid'
picture-options='zoom'
picture-uri='file:///usr/share/backgrounds/jasper.jpg'
primary-color='#a14f8c'
secondary-color='#200735'

[org/gnome/desktop/session]
idle-delay=uint32 120

[org/gnome/desktop/wm/preferences]
button-layout='appmenu:minimize,maximize,close'

[org/gnome/evolution-data-server]
migrated=true

[org/gnome/gnome-system-monitor]
show-dependencies=false
show-whose-processes='user'

[org/gnome/gnome-system-monitor/disktreenew]
col-6-visible=true
col-6-width=0

[org/gnome/gnome-system-monitor/proctree]
col-26-visible=false
col-26-width=0

[org/gnome/login-screen]
enable-fingerprint-authentication=true
enable-smartcard-authentication=false
enable-switchable-authentication=false

[org/gnome/maps]
last-viewed-location=[0.0, 0.0]
map-type='MapsVectorSource'
transportation-type='pedestrian'
window-maximized=true
zoom-level=2

[org/gnome/mutter]
attach-modal-dialogs=false
center-new-windows=true
overlay-key='Super_L'

[org/gnome/nautilus/icon-view]
default-zoom-level='small-plus'

[org/gnome/nautilus/preferences]
default-folder-viewer='icon-view'
migrated-gtk-settings=true
search-filter-time-type='last_modified'

[org/gnome/nautilus/window-state]
initial-size=(890, 550)
initial-size-file-chooser=(890, 550)

[org/gnome/nm-applet/eap/0af1e74b-657b-4266-8fed-f4e045b39749]
ignore-ca-cert=false
ignore-phase2-ca-cert=false

[org/gnome/nm-applet/eap/bc366963-c685-413b-889a-0e727d368c37]
ignore-ca-cert=false
ignore-phase2-ca-cert=false

[org/gnome/nm-applet/eap/fa522556-c116-4b45-a27a-9ef7d067a75b]
ignore-ca-cert=false
ignore-phase2-ca-cert=false

[org/gnome/settings-daemon/plugins/color]
night-light-last-coordinates=(43.670000000000002, -79.379400000000004)
night-light-schedule-automatic=false

[org/gnome/settings-daemon/plugins/housekeeping]
donation-reminder-last-shown=int64 1767588085943437

[org/gnome/settings-daemon/plugins/power]
sleep-inactive-ac-timeout=3600
sleep-inactive-ac-type='nothing'

[org/gnome/shell]
app-picker-layout=[{'Utilities': <{'position': <0>}>, 'System': <{'position': <1>}>, 'org.gnome.Calculator.desktop': <{'position': <2>}>, 'org.gnome.Calendar.desktop': <{'position': <3>}>, 'org.gnome.Snapshot.desktop': <{'position': <4>}>, 'org.gnome.Chess.desktop': <{'position': <5>}>, 'org.gnome.Tour.desktop': <{'position': <6>}>, 'io.github.celluloid_player.Celluloid.desktop': <{'position': <7>}>, 'org.gnome.Characters.desktop': <{'position': <8>}>, 'org.gnome.clocks.desktop': <{'position': <9>}>, 'org.gnome.Contacts.desktop': <{'position': <10>}>, 'org.gnome.Sudoku.desktop': <{'position': <11>}>, 'com.mattjakeman.ExtensionManager.desktop': <{'position': <12>}>, 'org.gnome.Firmware.desktop': <{'position': <13>}>, 'org.gnome.Maps.desktop': <{'position': <14>}>, 'org.gnome.Music.desktop': <{'position': <15>}>, 'com.borgbase.Vorta.desktop': <{'position': <16>}>, 'org.gnome.Weather.desktop': <{'position': <17>}>}]
disabled-extensions=@as []
enabled-extensions=['ding@rastersoft.com', 'gsconnect@andyholmes.github.io', 'appindicatorsupport@rgcjonas.gmail.com', 'dash-to-panel@jderose9.github.com', 'blur-my-shell@aunetx', 'arcmenu@arcmenu.com']
favorite-apps=['org.gnome.Nautilus.desktop', 'org.gnome.Ptyxis.desktop', 'chromium-browser.desktop', 'org.gnome.Evolution.desktop', 'org.gnome.TextEditor.desktop', 'org.gnome.Software.desktop', 'org.gnome.Settings.desktop']
last-selected-power-profile='performance'

[org/gnome/shell/app-switcher]
current-workspace-only=false

[org/gnome/shell/extensions/arcmenu]
activate-on-hover=true
button-item-icon-size='Large'
category-icon-type='Full_Color'
context-menu-items=[{'id': 'com.mattjakeman.ExtensionManager', 'name': 'Extension Manager'}, {'id': 'ArcMenu_Settings', 'name': 'ArcMenu Settings', 'icon': 'ArcMenu_ArcMenuIcon'}, {'id': 'ArcMenu_PanelExtensionSettings', 'name': 'Panel Extension Settings', 'icon': 'application-x-addon-symbolic'}, {'id': 'ArcMenu_Separator', 'name': 'Separator', 'icon': 'list-remove-symbolic'}, {'id': 'ArcMenu_PowerOptions', 'name': 'Power Options', 'icon': 'system-shutdown-symbolic'}, {'id': 'ArcMenu_ActivitiesOverview', 'name': 'Activities Overview', 'icon': 'view-fullscreen-symbolic'}, {'id': 'ArcMenu_ShowDesktop', 'name': 'Show Desktop', 'icon': 'computer-symbolic'}]
extra-categories=[(1, true), (2, true), (0, false), (3, false), (4, false)]
force-menu-location='Off'
hide-overview-on-startup=true
left-panel-width=225
menu-background-color='rgba(28,28,28,0.98)'
menu-border-color='rgb(63,62,64)'
menu-button-icon='xfce4_xicon1'
menu-button-icon-size=40
menu-font-size=12
menu-foreground-color='rgb(211,218,227)'
menu-height=575
menu-item-active-bg-color='rgba(228,228,226,0.15)'
menu-item-active-fg-color='rgb(255,255,255)'
menu-item-category-icon-size='Default'
menu-item-grid-icon-size='Large'
menu-item-hover-bg-color='rgba(238,238,236,0.08)'
menu-item-hover-fg-color='rgb(255,255,255)'
menu-item-icon-size='Large'
menu-layout='GnomeMenu'
menu-separator-color='rgb(63,62,64)'
menu-themes=[['ArcMenu Style', 'rgba(48,48,49,0.98)', 'rgb(223,223,223)', 'rgb(60,60,60)', '1', '14', '11', 'rgba(255,255,255,0.1)', 'rgb(21,83,158)', 'rgb(255,255,255)', 'rgb(25,98,163)', 'rgb(255,255,255)'], ['Simply Dark', 'rgba(28,28,28,0.98)', 'rgb(211,218,227)', 'rgb(63,62,64)', '1', '14', '11', 'rgb(63,62,64)', 'rgba(238,238,236,0.08)', 'rgb(255,255,255)', 'rgba(228,228,226,0.15)', 'rgb(255,255,255)'], ['Dark Blue', 'rgb(30,37,41)', 'rgb(189,230,251)', 'rgb(41,50,55)', '1', '14', '11', 'rgba(99,99,98,0.56)', 'rgba(189,230,251,0.08)', 'rgb(189,230,251)', 'rgba(189,230,251,0.15)', 'rgb(189,230,251)'], ['Light Blue', 'rgb(245,247,250)', 'rgb(18,51,84)', 'rgba(18,51,84,0.2)', '1', '14', '11', 'rgba(18,51,84,0.15)', 'rgba(18,51,84,0.08)', 'rgb(18,51,84)', 'rgba(18,51,84,0.15)', 'rgb(18,51,84)'], ['trilliumOS', 'rgba(28,28,28,0.98)', 'rgb(211,218,227)', 'rgb(63,62,64)', '1', '14', '12', 'rgb(63,62,64)', 'rgba(238,238,236,0.08)', 'rgb(255,255,255)', 'rgba(228,228,226,0.15)', 'rgb(255,255,255)']]
menu-width-adjustment=0
misc-item-icon-size='Large'
override-menu-theme=true
pinned-apps=@aa{ss} []
position-in-panel='Center'
prefs-visible-page=0
quicklinks-item-icon-size='Large'
recently-installed-apps=['devbox-code.desktop']
right-panel-width=305
runner-font-size=0
runner-menu-height-static=true
runner-searchbar-location='Bottom'
search-entry-border-radius=(true, 25)
searchbar-default-top-location='Bottom'
shortcut-icon-type='Full_Color'
show-activities-button=true
show-category-sub-menus=true
update-notifier-project-version=70

[org/gnome/shell/extensions/blur-my-shell]
settings-version=2

[org/gnome/shell/extensions/blur-my-shell/appfolder]
brightness=0.59999999999999998
sigma=30

[org/gnome/shell/extensions/blur-my-shell/dash-to-dock]
blur=true
brightness=0.59999999999999998
sigma=30
static-blur=true
style-dash-to-dock=0

[org/gnome/shell/extensions/blur-my-shell/panel]
brightness=0.59999999999999998
sigma=30

[org/gnome/shell/extensions/blur-my-shell/window-list]
brightness=0.59999999999999998
sigma=30

[org/gnome/shell/extensions/dash-to-panel]
animate-appicon-hover=false
animate-appicon-hover-animation-convexity={'RIPPLE': 2.0, 'PLANK': 1.0}
animate-appicon-hover-animation-duration={'SIMPLE': uint32 160, 'RIPPLE': 130, 'PLANK': 100}
animate-appicon-hover-animation-extent={'RIPPLE': 4, 'PLANK': 4, 'SIMPLE': 1}
animate-appicon-hover-animation-rotation={'SIMPLE': 0, 'RIPPLE': 10, 'PLANK': 0}
animate-appicon-hover-animation-travel={'SIMPLE': 0.29999999999999999, 'RIPPLE': 0.40000000000000002, 'PLANK': 0.0}
animate-appicon-hover-animation-type='SIMPLE'
animate-appicon-hover-animation-zoom={'SIMPLE': 1.0, 'RIPPLE': 1.25, 'PLANK': 2.0}
appicon-margin=4
appicon-padding=4
appicon-style='NORMAL'
available-monitors=[0]
dot-position='BOTTOM'
dot-style-focused='METRO'
dot-style-unfocused='METRO'
extension-version=70
global-border-radius=0
group-apps=true
hide-overview-on-startup=true
hotkeys-overlay-combo='TEMPORARILY'
leftbox-padding=-1
overview-click-to-exit=true
panel-anchors='{"unknown-unknown":"MIDDLE"}'
panel-element-positions='{"unknown-unknown":[{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"centerBox","visible":true,"position":"centerMonitor"},{"element":"showAppsButton","visible":false,"position":"centerMonitor"},{"element":"taskbar","visible":true,"position":"centerMonitor"},{"element":"rightBox","visible":false,"position":"stackedBR"},{"element":"activitiesButton","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":true,"position":"stackedBR"}]}'
panel-lengths='{"unknown-unknown":100}'
panel-positions='{"unknown-unknown":"BOTTOM"}'
panel-sizes='{"unknown-unknown":46}'
prefs-opened=false
primary-monitor=0
progress-show-count=true
show-apps-icon-file='/usr/share/icons/hicolor/scalable/apps/start-here.svg'
show-apps-icon-side-padding=0
show-apps-override-escape=true
show-favorites=true
show-favorites-all-monitors=true
show-running-apps=true
status-icon-padding=4
stockgs-keep-dash=false
trans-bg-color='#1c1c1c'
trans-border-use-custom-color=false
trans-border-width=6
trans-dynamic-anim-target=0.5
trans-panel-opacity=0.95000000000000007
trans-use-border=false
trans-use-custom-bg=true
trans-use-custom-gradient=false
trans-use-custom-opacity=false
trans-use-dynamic-opacity=false
tray-padding=4
window-preview-title-position='TOP'

[org/gnome/shell/extensions/ding]
add-volumes-opposite=false
check-x11wayland=true
dark-text-in-labels=false
show-home=false
show-network-volumes=true
show-trash=true
start-corner='top-right'

[org/gnome/shell/extensions/gsconnect]
enabled=false
missing-openssl=false
name='localhost.localdomain'
show-indicators=false

[org/gnome/shell/extensions/gsconnect/preferences]
window-maximized=false
window-size=(640, 550)

[org/gnome/shell/weather]
automatic-location=true
locations=@av []

[org/gnome/shell/world-clocks]
locations=@av []

[org/gnome/software]
allow-updates=true
check-timestamp=int64 1772138902
download-updates=true
download-updates-notify=true
first-run=false
flatpak-purge-timestamp=int64 1771651087
packaging-format-preference=['flatpak', 'rpm']
show-only-verified-apps=true
update-notification-timestamp=int64 1767573812

[org/gnome/system/location]
enabled=true

[org/gnome/tweaks]
show-extensions-notice=false

[org/gtk/gtk4/settings/color-chooser]
custom-colors=[(0.08235294371843338, 0.08235294371843338, 0.08235294371843338, 1.0), (0.10980392247438431, 0.10980392247438431, 0.10980392247438431, 0.98000001907348633), (0.18039216101169586, 0.18039216101169586, 0.18039216101169586, 1.0)]
selected-color=(true, 0.08235294371843338, 0.08235294371843338, 0.08235294371843338, 1.0)

[org/gtk/gtk4/settings/file-chooser]
date-format='regular'
location-mode='filename-entry'
show-hidden=false
sidebar-width=140
sort-column='name'
sort-directories-first=true
sort-order='ascending'
type-format='category'
view-type='list'
window-size=(909, 326)

[org/gtk/settings/file-chooser]
clock-format='12h'
EOF

dconf update
