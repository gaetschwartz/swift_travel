#!/usr/bin/env bash

flutter_path=$(which flutter)
if [ -z $flutter_path ]; then
  echo "Flutter not installed"
  current_version="0.0.0"
else
  current_version=$(cat $(dirname $flutter_path)/../version)
  echo "Current flutter version is: <$current_version>"
fi

# current arch
arch=$(uname -m)
if [ $arch == "x86_64" ]; then
  arch="x64"
fi

json=$(curl -s "https://storage.googleapis.com/flutter_infra_release/releases/releases_macos.json")
hash=$(echo $json | jq -r '.current_release.'$1'')
# echo "Latest hash is: $hash"
base_url=$(echo $json | jq -r '.base_url')
version=$(echo $json | jq -r '.releases[] | select(.hash == "'$hash'" and .dart_sdk_arch == "'$arch'")')
version_string=$(echo $version | jq -r '.version')
archive_url=$(echo $version | jq -r '.archive')

echo "Latest flutter version is: <$version_string>"

if [ $current_version == $version_string ]; then
  echo "Up to date"
else
  echo "We don't have the target version (target: $version_string, current: $current_version)."
  # if envman is available, set the env vars for the next step
  if [ -n "$(which envman)" ]; then
    echo "Setting env vars for the next step"
    envman add --key FLUTTER_ARCHIVE_URL --value "$base_url/$archive_url"
  else
    echo "envman not available, setting regular env vars"
    export FLUTTER_ARCHIVE_URL="$base_url/$archive_url"
  fi
fi
