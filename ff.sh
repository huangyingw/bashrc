#!/bin/bash
find_result="`echo "$2".ff.findresult |sed  -e "s/\//\_/g"`"
if [ -f "$find_result" ]; then
  read -p "the search is already done, if you want to update, press u --> " update
  case $update in
    u)
      ;;
    ?)
      vi "$find_result"
      exit 1
      ;;
  esac
fi
find -L "$1" -type f -iname "$2" -print > "$find_result"
vi "$find_result"
