#!/bin/bash
find "$1" \( -name \.git -o -name \.svn -o -name \.hg -o -path \/media\/smb \) -prune -type f -o -iname "$2"
