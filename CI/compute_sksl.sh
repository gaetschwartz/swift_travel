#!/usr/bin/env bash
set -e
set -x

file="shaders/flutter_01.sksl.json"

open -a Simulator.app

flutter drive --driver=test_driver/integration_test.dart \
--target=integration_test/app_test.dart \
--profile --cache-sksl \
--write-sksl-on-exit $file

echo "$(pwd)/$file"



