#!/bin/bash
if  (mdadm -D -q /dev/md0 |grep -q "removed")
then   
  mdadm -D -q /dev/md0 |grep -q "removed" >> $HOME/bashrc/check_raid.txt
  echo dangerous
fi
