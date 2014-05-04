#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi
/usr/bin/xscreensaver -no-splash &
xss-lock -- xscreensaver-command -lock &

X_STARTED=1
exec openbox-session

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
