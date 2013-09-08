#!/bin/bash
find . -type f -name \*.uxf -exec umlet -filename={} \;
