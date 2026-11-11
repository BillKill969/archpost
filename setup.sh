#!/bin/sh
set -e

mkdir -p /etc/udev/hwdb.d

cat << 'EOF' > /etc/udev/hwdb.d/90-disable-super.hwdb
evdev:atkbd:dmi:*
 KEYBOARD_KEY_db=reserved
EOF

systemd-hwdb update
udevadm trigger --subsystem-match=input --action=change

pacman -U 'https://archive.archlinux.org/packages/l/linux-firmware-amdgpu/linux-firmware-amdgpu-20250808-1-any.pkg.tar.zst'
