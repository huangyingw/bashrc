#!/bin/bash
if [ -z "$1" ];
then
  echo "Please provide commit message"
  exit 1
fi
git commit  --no-verify -am "$1" && git gc
~/bashrc/gps.sh
