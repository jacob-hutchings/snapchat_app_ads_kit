import Flutter
import UIKit
import SCAppAdsKit

public class SwiftSnapchatAppAdsKitPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "snapchat_app_ads_kit", binaryMessenger: registrar.messenger())
        let instance = SwiftSnapchatAppAdsKitPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "init": initialize(call, result)
        case "trackEvent": trackEvent(call, result)
        case "getPlatformVersion": result("iOS " + UIDevice.current.systemVersion)
        default: result(FlutterMethodNotImplemented)
        }
    }
    
    private func initialize(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        let args = call.arguments as! [String: Any]
        let appId = args["appId"] as! String
        print("appId: \(appId)")
        let appleAppid = "1512547727"
        SAAKAppAdsKit.shared().initialize(with: SAAKInitializationConfiguration(appId: appId, snapAppIds: [UUID(uuidString: appId)!], idfa: nil, manageSKAdNetwork: true)) { success, error in
            print("success: \(success). error: \(String(describing: error))")
            if let error = error {
                result(FlutterError(code: "1",
                                    message: error.localizedDescription,
                                    details: nil))
            }
            else {
//                SAAKAppAdsKit.shared().trackEvent(SAAKEventType.viewContent, metadata: nil) { success, error in
//                    print("track success: \(success). error: \(String(describing: error))")
//                }
                result(success)
            }
        }
    }

    private func trackEvent(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
//        let args = call.arguments as! [String: Any]
//        let appId = args["appId"] as! String
        SAAKAppAdsKit.shared().trackEvent(SAAKEventType.viewContent, metadata: nil) { success, error in
            print("track success: \(success). error: \(String(describing: error))")
            result(success)
        }
    }
}
