#!/bin/bash
git branch -D fix
for ss in `git remote -v |awk '/\(fetch\)$/{print $1}'`; do git push $ss :fix; done
git checkout -b fix
