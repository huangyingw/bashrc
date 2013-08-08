#!/bin/bash
SOCKFILE="/var/run/dbus/system_bus_socket"
if [ -e "$SOCKFILE" ]
then
  dbus-send --system --print-reply     --dest="org.freedesktop.UPower"     /org/freedesktop/UPower     org.freedesktop.UPower.Suspend
else
  pm-suspend
fi

