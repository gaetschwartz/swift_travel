#!/usr/bin/env bash
# fail if any commands fails
set -e
# debug log
set -x

#flutter drive --target=test_driver/app.dart --profile --cache-sksl --write-sksl-on-exit shaders/01.sksl.json
FILE=$(find $BITRISE_SOURCE_DIR/shaders -maxdepth 1 -name "*.sksl.json" -print | sort -rn | head -n 1)
if test -f "$FILE"; then
  echo "Found $FILE."
  envman add --key SKSL_ARGUMENTS --value "--bundle-sksl-path $FILE"
else 
  echo "Didn't find any sksl file."
fi
# find . -maxdepth 1 -name "*string*" ! -name "*:*" -print


