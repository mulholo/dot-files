#!/bin/bash

# End of day shut down script

echo "Pushing git changes"
git push

echo "Closing Slack"
pkill -x Slack

echo "Closing Linear"
pkill -x Linear

echo "Closing Docker"
pkill -x Docker

echo "Closing Safari"
pkill -x Safari

echo "Now close your tmux windows"
