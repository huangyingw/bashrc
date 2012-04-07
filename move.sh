#!/bin/bash
returnstring=""
function IsSlash()
{
  var=$1
  case $var in
    */)
      returnstring=$var 
      ;;
    *)
      returnstring=$var"/"
      ;;
  esac
}
IsSlash "$1"
SOURCE=$returnstring
IsSlash "$2"
TARGET=$returnstring

if [ "$SOURCE" != "$TARGET" ]
then
  if [ ! -d "$TARGET" ];
  then   
    mkdir -p "$TARGET"
  fi

  rsync -aH \
    "$SOURCE" "$TARGET" \
    && rsync -aH \
    "$SOURCE" "$TARGET" \
    && rm -fr "$SOURCE"
else
  echo "please choose the different dir!"
fi
