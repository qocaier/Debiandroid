#!/data/data/com.termux/files/usr/bin/bash
export PATH=/data/data/com.termux/files/usr/bin:$PATH
killall -9 termux-x11 Xorg 2>/dev/null
pkill -9 -f termux-x11
rm -rf /tmp/.X11-unix/
rm -f /tmp/.X-lock
termux-x11 :2 -ac &
sleep 3
proot-distro login debian --shared-tmp -- /bin/bash -c "export DISPLAY=:2; export XAUTHORITY=~/.Xauthority; export LC_ALL=ru_RU.UTF-8; dbus-launch --exit-with-session startxfce4"
