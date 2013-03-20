#!/bin/bash
git branch \
  |grep \* \
  && git checkout "$1"
