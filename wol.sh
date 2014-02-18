#!/bin/bash
if [ -z "$1" ]; then
  wakeonlan 00:0a:cd:1e:e9:be #server
  ping ubuntu
elif [ "$1" == "laptop" ]; then
  wakeonlan 00:21:cc:c0:53:a9 #laptop
  ping laptop
fi
