#!/usr/bin/env bash
set -e
set -x

echo "GIT_SHORT_SHA=$(git rev-parse --short "$GITHUB_SHA")" >> $GITHUB_ENV
echo "COMMIT_MSG=$(git log -1 --pretty=format:"%s")" >> $GITHUB_ENV
echo "COMMIT_NUMBER=$(git rev-list --count HEAD)" >> $GITHUB_ENV
echo "APP_VERSION=$(bash $GITHUB_WORKSPACE/CI/app_version.sh)" >> $GITHUB_ENV
echo "GOT_GIT_DATA=true" >> $GITHUB_ENV