#!/bin/bash

# Starts a new feature branch to match the Jira
# e.g. new-feat 1234 write-new-feat-script

jira_project="WEBSITE"
number=$1
description=$2
branch_name="${jira_project}-${number}-${description}"

cd ~/proj/memrise && git checkout master && git pull && git checkout -b $branch_name

