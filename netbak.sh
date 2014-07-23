#! /bin/bash
rsync -aH --force --exclude=/media/volgrp/kvm/* /media/volgrp/ ubuntu:/media/volgrp/ \
  ; $HOME/bashrc/rsleep.sh \
  & $HOME/bashrc/nubak.sh
