cd android
DECODED=$(echo "${INPUT_B64}" | base64 -d)
echo "${DECODED}" > key.properties