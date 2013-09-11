#!/bin/bash
if [ -z "$1" ];
then
    echo "Please provide the folder parameter"
    exit 1
fi
find "$1" -type f -name \*.uxf|while read ss
do 
    output="`echo "$ss"|sed  -e "s/\.uxf$/\.pdf/g"`"
    umlet -action=convert -format=pdf -filename="$ss" -output="$output"
done 
