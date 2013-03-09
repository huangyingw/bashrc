#!/bin/bash
XMLFILE=$1
DOMAIN=`echo "$XMLFILE" |sed 's/\.xml//g'`
virsh define "$XMLFILE" \
  && virsh destroy "$DOMAIN" \
  ; virsh start "$DOMAIN" 
