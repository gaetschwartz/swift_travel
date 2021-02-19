#!/usr/bin/env bash
# fail if any commands fails
set -e
# debug log
set -x



flutter_path=$(which flutter)
version=$(cat $(dirname $flutter_path)/../version)
echo "Current flutter version is: $version"

out=$(curl -s "https://storage.googleapis.com/flutter_infra/releases/releases_macos.json" | python3 CI/latest.py $1)

IFS=',' #setting space as delimiter  
read -a arr <<< "$out" #reading str as an array as tokens separated by IFS 

echo "Latest flutter version is: ${arr[0]}"

if [ $version == ${arr[0]} ]; then
  echo "Up to date"
else
  echo "We don't have latest."
  envman add --key FLUTTER_ARCHIVE_URL --value ${arr[1]}
fi
