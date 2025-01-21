#!/bin/sh

# Fetch the latest changes from the remote repository
git fetch

# Check if there are any changes between the local and remote repositories
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})

if [ $LOCAL != $REMOTE ]; then
  git add .
  git commit -a -m "Sync /Media"
  git push
else
  echo "No changes to sync."
fi