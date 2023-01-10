#import "WorldpayCheckoutPlugin.h"
#if __has_include(<worldpay_checkout/worldpay_checkout-Swift.h>)
#import <worldpay_checkout/worldpay_checkout-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "worldpay_checkout-Swift.h"
#endif

@implementation WorldpayCheckoutPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftWorldpayCheckoutPlugin registerWithRegistrar:registrar];
}
@end
