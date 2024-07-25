#!/bin/bash

# Change to your repository directory
cd ~/Documents/workspaces/ || exit

# Add all changes
git add .

# Commit the changes with a timestamp
git commit -m "Automated commit $(date '+%Y-%m-%d %H:%M:%S')"

# Push the changes to the remote repository
git push origin master
