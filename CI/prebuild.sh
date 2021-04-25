#!/usr/bin/env bash
set -e
set -x

if [ -z "$GIT_SHORT_SHA" ] || [ -z "$COMMIT_MSG" ] || [ -z "$COMMIT_NUMBER" ] || [ -z "$GOT_GIT_DATA" ]
then
      echo "[WARNING] Necessary variables are not set!"
      exit 0
fi

now=$(date +"%A %d %B %Y - %H:%M:%S")

cat > lib/constants/build.dart <<- EOM
const String commitBuildDate = "${now}";
const String commitHash = "${GIT_SHORT_SHA}";
const String commitMessage = "${COMMIT_MSG}";
const String buildNumber = "${COMMIT_NUMBER}";
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