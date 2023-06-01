#!/usr/bin/env bash

target_version=$1
if [ -z $target_version ]; then
  echo "Target version not specified"
  exit 1
fi

flutter_path=$(which flutter)
if [ -z $flutter_path ]; then
  current_version=""
  echo "Flutter not installed"
else
  current_version=$(cat $(dirname $flutter_path)/../version)
  echo "Current flutter version is: <$current_version>"
fi

# current arch
arch=$(uname -m)
case "$arch" in
  x86_64) arch="x64";;
  i386) arch="x64";;
  armv7l) arch="arm";;
  aarch64) arch="arm64";;
  # else it's already fine
esac

# current platform
platform=$(uname -s)
case "$platform" in
  Darwin) platform="macos";;
  Linux) platform="linux";;
  MINGW*) platform="windows";;
  *) echo "Unknown platform: $platform"; exit 1;;
esac
echo "Looking for latest version for $platform/$arch"

json=$(curl -s "https://storage.googleapis.com/flutter_infra_release/releases/releases_$platform.json")
hash=$(echo $json | jq -r '.current_release."'$target_version'"')
# echo "Latest hash is: $hash"
base_url=$(echo $json | jq -r '.base_url')
version=$(echo $json | jq -r '.releases[] | select(.hash == "'$hash'" and .dart_sdk_arch == "'$arch'")')
echo $version | jq
version_string=$(echo $version | jq -r '.version')
archive_url=$(echo $version | jq -r '.archive')
dart_sdk_version=$(echo $version | jq -r '.dart_sdk_version')

echo "Latest flutter version is: <$version_string>"

if [ "$current_version" == "$version_string" ]; then
  echo "Up to date"
else
  echo "We don't have the target version (target: $version_string, current: $current_version)."
  # if envman is available, set the env vars for the next step
  if [ -n "$(which envman)" ]; then
    echo "Setting env vars for the next step"
    envman add --key FLUTTER_ARCHIVE_URL --value "$base_url/$archive_url"
    envman add --key FLUTTER_VERSION --value "$version_string"
    envman add --key DART_SDK_VERSION --value "$dart_sdk_version"
  else
    echo "envman not available, setting regular env vars"
    export FLUTTER_ARCHIVE_URL="$base_url/$archive_url"
    export FLUTTER_VERSION="$version_string"
    export DART_SDK_VERSION="$dart_sdk_version"
  fi
fi
