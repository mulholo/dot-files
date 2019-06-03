#!/usr/bin/env bash

# Push current branch
git push -u origin $(git branch | grep \* | cut -d ' ' -f2)
# Make a PR for it
hub pull-request
