#!/bin/bash

set -eo pipefail

ls $PWD/build/Runner.ipa

xcrun altool --upload-app\
  -t ios \
  -f $PWD/build/Runner.ipa/Runner.ipa \
  -u "$APPLEID_USERNAME" \
  -p "$APPLEID_PASSWORD" \
  --verbose