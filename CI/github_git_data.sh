echo "::set-output name=hash::$(git rev-parse --short "$GITHUB_SHA")"
echo "::set-output name=msg::$(git log -1 --pretty=format:"%s")"
echo "::set-output name=count::$(git rev-list --count HEAD)"
echo "::set-output name=version::$(grep 'version:' $GITHUB_WORKSPACE/app/pubspec.yaml | awk '{print $2}' | cut -d "+" -f1)"