#!/bin/bash

set -eu

echo "## Running clang-format on C/C++ source in src/ directory"
SRC=$(find src -type f -name "*.[ch]pp")

clang-format -style=file -i $SRC

