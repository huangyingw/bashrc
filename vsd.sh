#!/bin/bash
DOMAIN=$1
XMLFILE=$2
virsh define "$XMLFILE" \
  && virsh destroy "$DOMAIN" \
  && virsh start "$DOMAIN" 
