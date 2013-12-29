#!/bin/bash
sshfs -o idmap=user `whoami`@ubuntu:/media/ /media/samba/
if [ $? -ne 0 ]; then
    sshfs -o idmap=user `whoami`@vdonkey:/media/ /media/samba/
fi
