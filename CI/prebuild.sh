#!/usr/bin/env bash
set -e
set -x

hash=$([[ $BITRISE_IO ]] && $GIT_CLONE_COMMIT_HASH || $GIT_HASH)
msg=$([[ $BITRISE_IO ]] && $BITRISE_GIT_MESSAGE || $GIT_MSG)
count=$([[ $BITRISE_IO ]] && $GIT_CLONE_COMMIT_COUNT || $COMMIT_COUNT)
now=$(date +"%H:%M:%S - %A %d %B %Y")

cat > lib/constants/build.dart <<- EOM
const String commitBuildDate = "${now}";
const String commitHash = "${hash}";
const String commitMessage = "${msg}";
const String buildNumber = "${count}";
EOM

echo "=== build.dart ==="
cat lib/constants/build.dart
echo "=================="