#!/bin/sh
set -e

# Checkout master as we are currently have an individual commit checked out on
# a detached tree. This means when we commit later it will be on a branch
git checkout master
git reset --hard origin/master

# Init the submodule and checkout the revision pinned in `.gitmodules`
git submodule update --init

# The version of the toolkit defined by the pinned submodule
PINNED_SUBMODULE_VERSION=`cat app/assets/VERSION.txt`

# Force the submodule to pull the latest and checkout origin/master
git submodule foreach git pull origin master

# The version of the toolkit defined in the submodules master branch
NEW_SUBMODULE_VERSION=`cat app/assets/VERSION.txt`

# Check we can install gem dependencies
bundle install

# If the submodule has a new version string
if [ "$PINNED_SUBMODULE_VERSION" != "$NEW_SUBMODULE_VERSION" ]; then
  # Commit the updated submodule and push it to origin
  git commit -am "Bump to version $NEW_SUBMODULE_VERSION"
  git push origin_ssh master
fi
