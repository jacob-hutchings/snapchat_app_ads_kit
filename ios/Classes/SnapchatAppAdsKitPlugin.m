#import "SnapchatAppAdsKitPlugin.h"
#if __has_include(<snapchat_app_ads_kit/snapchat_app_ads_kit-Swift.h>)
#import <snapchat_app_ads_kit/snapchat_app_ads_kit-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "snapchat_app_ads_kit-Swift.h"
#endif

@implementation SnapchatAppAdsKitPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSnapchatAppAdsKitPlugin registerWithRegistrar:registrar];
}
@end
