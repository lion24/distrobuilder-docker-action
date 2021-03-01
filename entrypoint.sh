#!/bin/bash -eux

# We need sudo access to use distrobuilder
"$HOME"/go/src/github.com/lxc/distrobuilder "$@"
