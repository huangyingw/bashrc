#!/bin/bash
if [ -z "$1" ];
then
  wakeonlan 00:0a:cd:1e:e9:be #server
  ping ubuntu
else
  wakeonlan b8:70:f4:ce:3d:f3
  wakeonlan 00:1a:4b:8d:a2:6e
  wakeonlan 00:01:c0:12:94:05 #mini
  wakeonlan 00:21:cc:c0:53:a9 #laptop
fi
