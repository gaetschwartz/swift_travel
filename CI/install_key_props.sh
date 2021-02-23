cd android
DECODED=$(echo "${KEY_PROPS_B64}" | base64 -d)
echo "${DECODED}" > key.properties