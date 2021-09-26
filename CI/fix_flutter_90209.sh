echo "[*] Fixing https://github.com/flutter/flutter/issues/90209"
FP="$(dirname $(which flutter))" 
sed -i "" "s/8\.0/9\.0/g" $FP/cache/artifacts/engine/ios-release/Flutter.xcframework/ios-arm64_armv7/Flutter.framework/Info.plist
sed -i "" "s/8\.0/9\.0/g" $FP/cache/artifacts/engine/ios-release/Flutter.xcframework/ios-arm64_x86_64-simulator/Flutter.framework/Info.plist

cat $FP/cache/artifacts/engine/ios-release/Flutter.xcframework/ios-arm64_armv7/Flutter.framework/Info.plist
cat $FP/cache/artifacts/engine/ios-release/Flutter.xcframework/ios-arm64_x86_64-simulator/Flutter.framework/Info.plist