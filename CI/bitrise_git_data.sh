#!/usr/bin/env bash
set -e
set -x

envman add --key GIT_SHORT_SHA --value "$GIT_CLONE_COMMIT_HASH"
envman add --key COMMIT_MSG --value "$BITRISE_GIT_MESSAGE"
envman add --key COMMIT_NUMBER --value "$([[ ! -z "$GIT_CLONE_COMMIT_COUNT" ]] && echo "$GIT_CLONE_COMMIT_COUNT" || echo "$(git rev-list --count main)")"
envman add --key APP_VERSION --value "$(bash $BITRISE_SOURCE_DIR/CI/app_version.sh $BITRISE_SOURCE_DIR)"
envman add --key GOT_GIT_DATA --value "true"