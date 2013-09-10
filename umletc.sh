#!/bin/bash
find . -type f -name \*.uxf -exec umlet -action=convert -format=pdf -filename={} \;
