#!/bin/bash
set -eu

if [ ! -f version.txt ]; then
  echo "1" > version.txt
else
  old_version=$(cat version.txt)
  new_version=$((old_version + 1))
  echo $new_version > version.txt
fi