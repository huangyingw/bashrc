#!/bin/bash
TARGET=$1
qemu-img create -f qcow2 "$TARGET".qcow2  20000G
