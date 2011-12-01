#!/bin/bash
find $1 -type f -print0 | xargs -0 ls -l | sort -k5,5n
