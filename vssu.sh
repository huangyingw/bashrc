#!/bin/bash
DOMAIN=$1
SNAPSHOT=$2
~/bashrc/vssd.sh "$DOMAIN" "$SNAPSHOT"
~/bashrc/vssc.sh "$DOMAIN" "$SNAPSHOT"
