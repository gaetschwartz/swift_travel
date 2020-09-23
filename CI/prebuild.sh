git_hash=$(git rev-parse --short "$GITHUB_SHA")
git_msg=$(printf "%q" "$(git log -1 --pretty=format:"%s")")
now=$(date +"%H:%M:%S - %A %d %B %Y")
cat > lib/utils/build.dart <<- EOM
const String commitBuildDate = "${now}";
const String commitHash = "${git_hash}";
const String commitMessage = "${git_msg}";
const String buildNumber = "$GITHUB_RUN_NUMBER";
EOM
echo "=== build.dart ==="
cat lib/utils/build.dart
echo "=================="
pod deingrate