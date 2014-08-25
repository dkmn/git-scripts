#!/bin/sh
# DKKim 20140825
# remove remote git branch# script to convert a branch to a tag
# then delete branch
# usage: branch_to_tag $BRANCHNAME

REF1=`git show-ref --heads --hash "$1"`
echo $1 $REF1
git tag $1 $REF1
git branch -D $1

#git push origin :$1
for remote in $(git remote); do git push $remote :$1; done
for remote in $(git remote); do git push --tags $remote $1; done
