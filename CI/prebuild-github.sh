#!/usr/bin/env bash
# fail if any commands fails
set -e
# debug log
set -x
git_hash=$(git rev-parse --short "$GITHUB_SHA")
git_msg=$(printf "%q" "$(git log -1 --pretty=format:"%s")")
now=$(date +"%H:%M:%S - %A %d %B %Y")
nbr=$(git rev-list --count origin/$(git rev-parse --abbrev-ref HEAD))
cat > lib/utils/build.dart <<- EOM
const String commitBuildDate = "${now}";
const String commitHash = "${git_hash}";
const String commitMessage = "${git_msg}";
const String buildNumber = "${nbr}";
EOM
echo "=== build.dart ==="
cat lib/utils/build.dart
echo "=================="