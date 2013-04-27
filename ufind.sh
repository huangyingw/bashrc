#!/bin/bash
while getopts ab: name
do
  case $name in
    a)     aflag=1;;
  b)     bflag=1
    bval="$OPTARG";;
  ?)     printf "Usage: %s: [-a] [-b value] args\n" $0
    exit 2;;
esac
done
#ls *.findresult|while read ss; do echo $ss|sed 's/.findresult//g'; done \
  #  |while read ss;do Find "." "$ss";done
