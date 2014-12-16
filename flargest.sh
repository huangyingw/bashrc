#!/bin/bash
find $1 -type f -exec du -sk {} \; | sort -n
