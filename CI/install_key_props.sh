cd android
DECODED=$(echo "$B64" | base64 -d)
echo "${DECODED}" > key.properties