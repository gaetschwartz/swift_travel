#!/usr/bin/env bash
set -e
set -x

file="shaders/flutter_01.sksl.json"

/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app/Contents/MacOS/Simulator \
-CurrentDeviceUDID com.apple.CoreSimulator.SimDeviceType.iPhone-12-Pro-Max &

flutter drive --driver=test_driver/integration_test.dart \
--target=integration_test/app_test.dart \
--profile --cache-sksl \
--write-sksl-on-exit $file

killall Simultator

echo "$file"



