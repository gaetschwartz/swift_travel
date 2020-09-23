#flutter drive --target=test_driver/app.dart --profile --cache-sksl --write-sksl-on-exit shaders/01.sksl.json
FILE=$BITRISE_SOURCE_DIR/shaders/01.sksl.json
if test -f "$FILE"; then
  export SKSL_ARGUMENTS="--bundle-sksl-path $FILE"
fi

