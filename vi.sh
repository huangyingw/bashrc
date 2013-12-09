#!/bin/bash
if [ -z "$1" ];
then
  vim /export/home1/username/cscope_db/cscope.files
fi
vim "$1"
