#!/bin/bash
function upsearch () {
  test / == "$PWD" && return || test -e "$1" && echo "found: " "$PWD" && return || cd .. && upsearch "$1"
}
upsearch "cscope.out"
parent=
~/bashrc/faa.sh `pwd` "$2"
