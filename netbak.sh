#! /bin/bash
$HOME/bashrc/nubak.sh \
  ; rsync -aH --force --exclude=/media/volgrp/kvm/* /media/volgrp/ ubuntu:/media/volgrp/ \
  ; $HOME/bashrc/rsleep.sh
