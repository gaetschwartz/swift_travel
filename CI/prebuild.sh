#!/usr/bin/env bash
# fail if any commands fails
set -e
# debug log
set -x
git_hash=$GIT_CLONE_COMMIT_HASH
git_msg=$(printf "%q" "$GIT_CLONE_COMMIT_MESSAGE_BODY")
now=$(date +"%H:%M:%S - %A %d %B %Y")
cat > lib/utils/build.dart <<- EOM
const String commitBuildDate = "${now}";
const String commitHash = "${git_hash}";
const String commitMessage = "${git_msg}";
const String buildNumber = "$GIT_CLONE_COMMIT_COUNT";
EOM
echo "=== build.dart ==="
cat lib/utils/build.dart
echo "=================="
cd $BITRISE_SOURCE_DIR/ios
pod deintegrate