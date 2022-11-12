#!/bin/bash

set -eu

echo "## Marking pwd as safe"
git config --global --add safe.directory "$PWD"

echo "## Configuring git author..."
git config --global user.email "clang-format@rathena.com"
git config --global user.name "rAthena Clang Format"

echo "## Running clang-format on C/C++ source in src/ directory"
SRC=$(git ls-tree -r HEAD src | grep -e "\.\(c\|h\|hpp\|cpp\)\$" | cut -f 2)

echo "## Using $(clang-format --version)" 

clang-format -style=file -i $SRC

echo "## Commiting files..."
git commit -a -m "apply clang-format" || true

echo "## Pushing to $BRANCH"
git push -u origin $BRANCH
