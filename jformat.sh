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
  LIST=( -name \*.java -o -name \*.vala )
  find "$folderForGit" -type f \( "${LIST[@]}" \) -exec astyle --mode=java -fxejoO -y -t2 --style=java -pcHs2 {} \; 
else
  echo -e "${red}the git repository is unclean, please check it before continuing... ${NC}"
fi
