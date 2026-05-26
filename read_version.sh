#!/bin/bash
set -eu

base_version=$(cat Dockerfile | grep "^FROM" | cut -d':' -f2)
community_version=$(cat version.txt)

echo "$base_version-$community_version"