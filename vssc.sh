#!/bin/bash
DOMAIN=$1
SNAPSHOT=$2
virsh destroy "$DOMAIN" \
  && virsh snapshot-create "$DOMAIN" "$SNAPSHOT" \
  && virsh start "$DOMAIN" 
