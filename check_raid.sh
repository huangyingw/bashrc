#!/bin/bash
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
