#!/bin/bash -

repo=$1
tmp=$(mktemp -d)
barerepo=$tmp/$repo.git

git clone --bare "$repo" "$barerepo"
cd "$tmp"
tar zcf - "$repo.git" | pv | ssh sigma 'cd ~/repos/git; tar xzf -'

#echo 'Give permission to someone?'
#read someone
#if [ "$someone" ];then
#    ssh sigma "cd ~/repos/git; ./afspermit.sh $repo.git $someone"
#fi

