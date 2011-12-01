#! /bin/bash
if [ -z "$1" ];
then
  valgrind -v --leak-check=full ./run
else
  valgrind -v --leak-check=full ./$1
fi
