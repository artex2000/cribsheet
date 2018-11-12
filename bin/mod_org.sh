#!/bin/sh

if [ -z $1 ]; then
    target=HEAD^
else
    target=HEAD~$1
fi
branch=$(git symbolic-ref --short -q HEAD)
files=$(git diff --name-only $target)
mod=./diff/mod
org=./diff/org
mkdir -p $mod
mkdir -p $org
for file in $files
do
    [[ -e $file ]] && cp --parents $file $mod
done
git checkout -q $target
for file in $files
do
    [[ -e $file ]] && cp --parents $file $org
done
git checkout -q $branch



    
