#!/usr/bin/env bash
set -e

# Stolen from: https://stackoverflow.com/questions/3878624/how-do-i-programmatically-determine-if-there-are-uncommitted-changes
require_clean_work_tree () {
    # Update the index
    git update-index -q --ignore-submodules --refresh
    err=0

    # Disallow unstaged changes in the working tree
    if ! git diff-files --quiet --ignore-submodules --
    then
        echo >&2 "cannot $1: you have unstaged changes."
        git diff-files --name-status -r --ignore-submodules -- >&2
        err=1
    fi

    # Disallow uncommitted changes in the index
    if ! git diff-index --cached --quiet HEAD --ignore-submodules --
    then
        echo >&2 "cannot $1: your index contains uncommitted changes."
        git diff-index --cached --name-status -r --ignore-submodules HEAD -- >&2
        err=1
    fi

    if [ $err = 1 ]
    then
        echo >&2 "Please commit or stash them."
        exit 1
    fi
}

##                   ##
#     MAIN METHOD     #
##                   ##
DATE=$(date -u -Iseconds)
DATE_TAG=$(date -u +%Y.%m.%dT%H.%M.%SZ)

echo "Checking git for clean work tree"
require_clean_work_tree

echo "Updating version file"
echo "Deployed on: $DATE" > www/version.txt

aws s3 cp www s3://senders-io/ --recursive
echo "Deployed!"

echo "Committing deploy"
git commit -am "Deployed: $DATE"
git tag -a $DATE_TAG -m "Deployed to s3 on $DATE"
echo "Done!"

