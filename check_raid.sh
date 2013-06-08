#!/bin/bash
OS=`uname`
if [ $OS == "Darwin" ]
then
  exit 0;
fi
raid_count=`mdadm -D /dev/md/* |grep "active sync"|wc -l`
if [ $raid_count -lt 4 ] 
then   
  echo dangerous
  echo dangerous
  echo dangerous
else
  echo success
  echo success
  echo success
fi
