#!/bin/bash

set -eo pipefail

xcrun altool --upload-app\
  -t ios \
  -f $PWD/build/Runner.ipa \
  -u "$APPLEID_USERNAME" \
  -p "$APPLEID_PASSWORD" \
  --verbose