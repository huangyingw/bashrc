#!/bin/bash
rsync --remove-source-files -aH --force -e ssh "$1" "$2" \
  && rm -fr "$1"
