#!/bin/bash

# Starts a new feature branch to match the Jira ticket number
# e.g. new-feat 1234 "write new feat script" -> git checkout -b WEBSITE-1234/write-new-feat-script

jira_project="WEBSITE"
number=$1
description=$2

if [[ -z "$number" ]]; then
  echo "no number passed"
elif [[ -z "$description" ]]; then
  echo "no description passed"
else
  hyphenated_description=${description// /-}
  branch_name="${jira_project}-${number}/${hyphenated_description}"
  cd ~/proj/memrise && git checkout master && git pull && git checkout -b $branch_name
fi
