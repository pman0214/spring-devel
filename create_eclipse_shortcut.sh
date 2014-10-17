#!/bin/sh

target=/usr/share/applications/eclipse.desktop

cat <<EOF > $target
[Desktop Entry]
Version=4.3
Type=Application
Name=eclipse
Comment=
Exec=/usr/local/bin/eclipse
Icon=/usr/local/eclipse/icon.xpm
Path=
Terminal=false
StartupNotify=false
EOF