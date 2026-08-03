#!/bin/bash
set -eu

# base_version=$(cat Dockerfile | grep "^FROM" | cut -d':' -f2)
base_version=$(cat Dockerfile | grep "^ARG MAGDAMOCK_VERSION" | cut -d'=' -f2 | tr -d "\"")
community_version=$(cat version.txt)

echo "$base_version-$community_version"
