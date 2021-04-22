echo "GITHUB_SHORT_SHA=$(git rev-parse --short "$GITHUB_SHA")" >> $GITHUB_ENV
echo "COMMIT_MSG=$(git log -1 --pretty=format:"%s")" >> $GITHUB_ENV
echo "COMMIT_NUMBER=$(git rev-list --count HEAD)" >> $GITHUB_ENV
echo "APP_VERSION=$(grep 'version:' $GITHUB_WORKSPACE/app/pubspec.yaml | awk '{print $2}' | cut -d "+" -f1)" >> $GITHUB_ENV