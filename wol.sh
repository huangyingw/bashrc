#!/bin/bash
if [ -z "$1" ]; then
  wakeonlan 00:0a:cd:1e:e9:be #server
  ping ubuntu
elif [ "$1" == "toshiba" ]; then
  wakeonlan b8:70:f4:ce:3d:f3 #toshiba
  ping toshiba
elif [ "$1" == "thinkpad" ]; then
  wakeonlan 00:21:cc:c0:53:a9 #thinkpad
  ping thinkpad
elif [ "$1" == "mldonkey" ]; then
  wakeonlan 00:01:c0:12:92:a2 #mldonkey
  ping mldonkey
fi
