#!/usr/bin/env bash
set -e
set -x

xcrun simctl list
/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app/Contents/MacOS/Simulator \
-CurrentDeviceUDID com.apple.CoreSimulator.SimDeviceType.iPhone-12-Pro-Max&

flutter drive --driver=test_driver/integration_test.dart \
--target=integration_test/app_test.dart \
--profile --cache-sksl \
--write-sksl-on-exit $1

echo "Killing Simulator"
killall Simultator




