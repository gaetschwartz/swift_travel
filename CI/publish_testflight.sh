#!/bin/bash

set -eo pipefail

cp $PWD/build/Runner.ipa $PWD/build/Runner-ipa.zip
unzip $PWD/build/Runner-ipa.zip
ls $PWD/build/Runner-ipa
echo $PWD/build/Runner-ipa/Info.list

xcrun altool --upload-app\
  -t ios \
  -f $PWD/build/Runner.ipa \
  -u "$APPLEID_USERNAME" \
  -p "$APPLEID_PASSWORD" \
  --verbose