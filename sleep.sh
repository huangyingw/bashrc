#!/bin/bash
if [ -f /var/run/dbus/system_bus_socket ]; then
  dbus-send --system --print-reply     --dest="org.freedesktop.UPower"     /org/freedesktop/UPower     org.freedesktop.UPower.Suspend
else
  pm-suspend
fi

