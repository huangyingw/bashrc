#!/bin/sh
if [ -z "$1" ];
then
  echo Please provide the specified sql file
else
  user="root"
  pass="1qaz@WSX"
  mysql -u "$user" -p"$pass" < "$1"
fi
