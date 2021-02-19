#!/usr/bin/env bash
set -e

hash=$([[ $BITRISE_IO ]] && echo $GIT_CLONE_COMMIT_HASH || echo $GIT_HASH)
msg=$([[ $BITRISE_IO ]] && echo $BITRISE_GIT_MESSAGE || echo $GIT_MSG)
count=$([[ $BITRISE_IO ]] && echo $GIT_CLONE_COMMIT_COUNT || echo $COMMIT_COUNT)
now=$(date +"%A %d %B %Y - %H:%M:%S")

cat > lib/constants/build.dart <<- EOM
const String commitBuildDate = "${now}";
const String commitHash = "${hash}";
const String commitMessage = "${msg}";
const String buildNumber = "${count}";
EOM

echo "=== build.dart ==="
cat lib/constants/build.dart
echo "=================="

cat > assets/config.json <<- EOM
{"sncfKey": "$SNCF_KEY"}
EOM


echo "=== config.json ==="
cat assets/config.json
echo "=================="