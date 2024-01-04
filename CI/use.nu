# #!/usr/bin/env bash
# set -e

# SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# APP_DIR=$(dirname "$SCRIPT_DIR")
# # first arg is the version
# VERSION=$1

# # ccheck if $PURO_ROOT is not set or not valid
# if [ -z "$PURO_ROOT" ] || [ ! -d "$PURO_ROOT" ]; then
#     echo "PURO_ROOT not set or not valid: \"$PURO_ROOT\", falling back to looking for puro executable"
#     PURO_EXE=$(command -v puro)
#     if [ -z "$PURO_EXE" ]; then
#         echo "puro not found"
#         exit 1
#     fi
#     PURO_ROOT=$(dirname "$(dirname "$PURO_EXE")")
# fi

# ln -s -f "$PURO_ROOT" "$APP_DIR/.puro"
# if [ $? -ne 0 ]; then
#     echo "Failed to create symlink"
#     exit 1
# fi
# echo "Created symlink to $PURO_ROOT at $APP_DIR/.puro"

# # if provided, use puro use <version>
# if [ -n "$VERSION" ]; then
#     "$PURO_ROOT/.puro/bin/puro" use "$VERSION" --project "$APP_DIR"
# fi

# # update .vscode/settings.json to replace PURO_ROOT with $APP_DIR/.puro using jq in dart.flutterSdkPath and dart.sdkPath
# NEW_SETTINGS=$(jq --arg PURO_ROOT ".puro/" '.["dart.flutterSdkPath"] = $PURO_ROOT | .["dart.sdkPath"] = $PURO_ROOT' "$APP_DIR/.vscode/settings.json")
# # print changes using git diff with color without header (tail)
# echo "$NEW_SETTINGS" | git diff --no-index --color=always --no-prefix -- "$APP_DIR/.vscode/settings.json" - | tail -n +6
# # write changes to settings.json
# echo "$NEW_SETTINGS" > "$APP_DIR/.vscode/settings.json"

export def main [version?: string] {
    let SCRIPT_DIR = $env.FILE_PWD
    let APP_DIR = $SCRIPT_DIR | path dirname

    let PURO_ROOT = if "PURO_ROOT" in $env {
        $env.PURO_ROOT
    } else {
        let PURO_EXE = which puro | get path
        if ($PURO_EXE | length) == 0 {
            echo "puro not found"
            exit 1
        }
        $PURO_EXE | first | path dirname
    } | path expand

    # create symlink
    let PURO_ROOT_LINK = [$APP_DIR, ".puro"] | path join
    let PURO_TARGET = [$PURO_ROOT, "envs", ($version | default "default")] | path join
    # rm -rf $PURO_ROOT_LINK
    match $nu.os-info.name {
        "windows" => {
            cmd /c rmdir $PURO_ROOT_LINK
            cmd /c mklink /J $PURO_ROOT_LINK $PURO_TARGET
            if $env.LAST_EXIT_CODE != 0 {
                echo "Failed to create symlink"
                exit 1
            }
         }
        _ => {
            ln -s -f $PURO_TARGET $PURO_ROOT_LINK
            if $env.LAST_EXIT_CODE != 0 {
                echo "Failed to create symlink"
                exit 1
            }
        }
    }

    print $"Created symlink to ($PURO_TARGET) at ($PURO_ROOT_LINK)"

    let settings = [$APP_DIR, ".vscode", "settings.json"] | path join
    let old_settings = open $settings
    # update .vscode/settings.json to replace PURO_ROOT with $APP_DIR/.puro using jq in dart.flutterSdkPath and dart.sdkPath
    let new_setings = $old_settings | update "dart.flutterSdkPath" ".puro/flutter" | update "dart.sdkPath" ".puro/flutter/bin/cache/dart-sdk"
    print "Changes to settings.json:"
    print $"  \"dart.flutterSdkPath\": \"($old_settings | get "dart.flutterSdkPath")\" -> \"($new_setings | get "dart.flutterSdkPath")\""
    print $"  \"dart.sdkPath\": \"($old_settings | get "dart.sdkPath")\" -> \"($new_setings | get "dart.sdkPath")\""
    # write changes to settings.json
    $new_setings | save $settings -f
}





