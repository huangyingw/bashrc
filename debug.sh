#! /bin/bash
if [ -z "$1" ];
then
  valgrind -v --leak-check=full ./*.exe
else
  valgrind -v --leak-check=full ./$1
fi
