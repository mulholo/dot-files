#!/usr/bin/env bash

# clones a repo from github into the right folder and takes you there
# use . or source before the script to make the cd work in your current context
# usage: . get-repo zeit next.js

cmd='cd ~/proj/ && git clone "https://github.com/${org}/${repo_name}" && cd $repo_name'

# yarn install if -y flag is passed
if [[ $1 = '-y' ]]; then
  org=$2
  repo_name=$3
  yarn_cmd="${cmd} && yarn install"
  eval $yarn_cmd
else
  org=$1
  repo_name=$2
  eval $cmd
fi
