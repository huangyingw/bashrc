#!/bin/bash 
red='\033[0;31m'
green='\033[0;32m'
NC='\033[0;0m' # No Color
if [ -z "$1" ];
then
  echo -e "${red}Please provide remote machine name ${NC}"
  exit 1
fi
ssh "$1" pm-suspend
