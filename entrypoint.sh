#!/bin/bash

set -eu

# echo "## Marking pwd as safe"
# git config --global --add safe.directory "$PWD"

echo "## Running clang-format on C/C++ source in src/ directory"
# SRC=$(git ls-tree -r HEAD src | grep -e "\.\(c\|h\|hpp\|cpp\)\$" | cut -f 2)
SRC=$(find src -type f -name "*.[ch]pp")

clang-format -style=file -i $SRC

