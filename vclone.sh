#!/bin/bash
ORIGIN=$1
TARGET=$2
DIR=/media/vmware/kvm/"$TARGET"/
if [ ! -d "${DIR}" ];
then   
  mkdir -p "${DIR}"
fi
virsh destroy "$ORIGIN" \
  ; virt-clone --force --original "$ORIGIN" --name "$TARGET" --file "$DIR"/"$TARGET".qcow2 \
  && virsh start "$TARGET" \
  && virsh dumpxml "$TARGET" > "$DIR"/"$TARGET".xml
