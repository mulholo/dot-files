#!/bin/bash

# Morning set up script

echo "Opening Docker"
open -g -a Docker
echo ""

echo "Navigating to Phoenix"
cd ~/proj/Phoenix
echo ""

echo "Fetching git changes"
git fetch origin
echo ""

echo "Updating brew packages to latest version"
brew upgrade
echo ""

echo "Authenticating GCloud"
gcloud auth application-default login
echo ""

echo "Opening Linear"
open -g -a Linear
echo ""

echo "Opening Slack"
open -g -a Slack
echo ""

echo "Opening Roam"
open -g -a "Roam Research"
echo ""

echo "Starting docker containers"
sleep 15
docker-compose up -d
echo ""

figlet -f isometric1 ATTIO

