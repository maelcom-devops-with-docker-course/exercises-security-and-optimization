#!/bin/sh

if [ "$#" -ne 2 ]; then
  echo "Usage: ./builder.sh <github-repo> <docker-image>"
  exit 1
fi

tempdir=$(mktemp -d)

GITHUB_REPO_URL=https://github.com/$1
git clone -- "$GITHUB_REPO_URL" "$tempdir"

DOCKER_IMAGE=$2
docker build -t "$DOCKER_IMAGE" "$tempdir"
docker push "$DOCKER_IMAGE"

rm -rf -- "$tempdir"
