#! /bin/bash
if [ "$OS" == "Linux" ]
then
  autossh -X "$1"
else
  ssh -X "$1"
fi
