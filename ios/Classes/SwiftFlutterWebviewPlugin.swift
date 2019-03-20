import Flutter
import UIKit

public class SwiftFlutterWebviewPlugin: NSObject, FlutterPlugin {
  
    public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_webview", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterWebviewPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let arguments = call.arguments as! Dictionary<String, String>
    let webViewController = WebViewController(url: arguments["url"]!)
    let rootViewController = UIApplication.shared.delegate?.window??.rootViewController
    rootViewController?.show(webViewController, sender: nil)
    result(nil)
  }
}
