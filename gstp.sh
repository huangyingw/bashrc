#!/bin/bash
if [ -z "$1" ];
then
  echo "Please provide the stash index"
  exit 1
fi
git stash pop stash@{"$1"}
