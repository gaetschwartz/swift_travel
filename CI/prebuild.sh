#!/usr/bin/env bash
set -e
set -x

if [ -z "$GIT_SHORT_SHA" ] || [ -z "$COMMIT_MSG" ] || [ -z "$COMMIT_NUMBER" ] || [ -z "$GOT_GIT_DATA" ]; then
  echo "[WARNING] Necessary variables are not set!"
  exit 0
fi

now_str=$(date +"%A %d %B %Y - %H:%M:%S")
now=$(date +%s000)

BASE64_COMMIT_MSG=$(base64 <<<"$COMMIT_MSG")

cat >lib/constants/build.dart <<-EOM
import 'dart:convert';

const commitBuildDate = '${now_str}';
const commitHash = '${GIT_SHORT_SHA}';
const commitMessageBase64 = '${BASE64_COMMIT_MSG}';
final commitMessage = utf8.decode(base64.decode(commitMessageBase64));
const buildNumber = '${COMMIT_NUMBER}';
EOM

echo "=== build.dart ==="
cat lib/constants/build.dart
echo "=================="

cat >assets/config.json <<-EOM
{"sncfKey": "$SNCF_KEY", "triasKey": "$TRIAS_KEY"}
EOM

# write key properties
echo "$KEY_PROPERTIES" >android/key.properties
