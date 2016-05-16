#!/usr/bin/env bash

workdir=$(dirname $0)
echo "Running in $workdir"
run-parts --regex "\.sh$" "$workdir/scripts"
