#!/bin/bash

set -eo pipefail

xcodebuild -workspace ios/Runner.xcworkspace \
  -scheme Runner \
  -sdk iphoneos \
  -configuration Release archive \
  -archivePath $PWD/build/Runner.xcarchive


xcodebuild -exportArchive \
  -archivePath $PWD/build/Runner.xcarchive \
  -exportOptionsPlist CI/exportOptions.plist \
  -exportPath $PWD/build/Runner.ipa
