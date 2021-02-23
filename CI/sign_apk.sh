cd $ANDROID_HOME/build-tools/30.0.2/
./apksigner sign -ks android/app/key.jks --ks-pass pass:$PASSWORD build/app/outputs/flutter-apk/app-release.apk

