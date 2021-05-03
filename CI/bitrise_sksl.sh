#!/usr/bin/env bash
set -e
set -x

file="shaders/flutter_01.sksl.json"
bash $BITRISE_SOURCE_DIR/CI/compute_sksl.sh $file
if [ -f "$FILE" ]; then
  echo "Found sksl file: $file"
  envman add --key SKSL_ARGUMENT --value "--bundle-sksl-path=$file"
else
  echo "$file doesn't exist, probably not created..."
fi