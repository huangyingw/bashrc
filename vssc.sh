#!/bin/bash
DOMAIN=$1
SNAPSHOT=$2
virsh destroy "$DOMAIN" \
  ; virsh snapshot-create-as "$DOMAIN" "$SNAPSHOT" \
  && virsh start "$DOMAIN" \
  && virsh snapshot-list "$DOMAIN"
