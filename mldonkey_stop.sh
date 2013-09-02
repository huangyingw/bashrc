#! /bin/bash
/etc/init.d/mldonkey-server stop \
    && umount /media/mldonkey/ \
    && ~/bashrc/sleep.sh
