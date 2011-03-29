#!/bin/bash
if [ -z "$1" ];
then
  git add .
else
  git add -f $1
fi
