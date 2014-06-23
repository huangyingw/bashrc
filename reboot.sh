#!/bin/bash
vm_count=`$HOME/kvmrc/vsl.sh|wc -l`
if [ $vm_count -gt 3 ] 
then   
  $HOME/kvmrc/vsave.sh
fi
reboot
