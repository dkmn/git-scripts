#!/bin/sh
# DKKim 20140825
# remove remote git branch# script to convert a branch to a tag
# then delete branch
# usage: branch_to_tag $BRANCHNAME

# get the specific SHA hash of the commit to which the branch points
REF1=`git show-ref --heads --hash "$1"`
echo $1 $REF1

# create a tag at this specific commit
git tag $1 $REF1
# delete the branch pointer
git branch -D $1

# iterate through all remotes and delete branch
for remote in $(git remote); do git push $remote :$1; done
# iterate through all remotes and push tag (reference is now unique as the
# branch is gone)
for remote in $(git remote); do git push $remote $1; done
