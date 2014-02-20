#! /bin/bash
red='\033[0;31m'
green='\033[0;32m'
NC='\033[0;0m' # No Color
if [ -n "$1" ];
then
  folderForGit="$1"
else
  folderForGit=.
fi
if  ( git status "$folderForGit"|grep -q 'nothing to commit' )
then
  find "$folderForGit" -type f -name \*.java -exec astyle --mode=java -fxejoO  -t2 --style=java {} \; 
else
  echo -e "${red}the git repository is unclean, please check it before continuing... ${NC}"
fi
