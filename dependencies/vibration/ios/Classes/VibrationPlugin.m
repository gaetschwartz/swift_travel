#import "VibrationPlugin.h"
#if __has_include(<vibration/vibration-Swift.h>)
#import <vibration/vibration-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "vibration-Swift.h"
#endif

@implementation VibrationPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftVibrationPlugin registerWithRegistrar:registrar];
}
@end
