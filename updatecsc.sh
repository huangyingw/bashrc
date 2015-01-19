#!/bin/bash
PROPERTIES=`hostname`.csc.properties
while read ss
do
  ~/bashrc/cscope.sh "$ss"
done < "$PROPERTIES"
read -p "press any key to continue...." update
