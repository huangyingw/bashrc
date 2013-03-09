#!/bin/bash
DOMAIN=$1
SNAPSHOT=$2
virsh snapshot-revert "$DOMAIN" "$SNAPSHOT" \
  && virsh start "$DOMAIN" 
