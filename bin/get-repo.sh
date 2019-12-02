#!/usr/bin/env bash

# clones a repo from github into the right folder and takes you there
# use . or source before the script to make the cd work in your current context
# usage: . get-repo zeit next.js

org=$1
repo_name=$2

cd ~/proj/ && git clone "https://github.com/${org}/${repo_name}" && cd $repo_name
