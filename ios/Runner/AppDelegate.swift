import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    let _controller = window?.rootViewController as! FlutterViewController
    let _channel = FlutterMethodChannel(
      name: "plistparser.maemae.dev/plistparser",
      binaryMessenger: _controller.binaryMessenger)

    _channel.setMethodCallHandler({
      (call: FlutterMethodCall, result: FlutterResult) -> Void in
        switch(call.method) {
        case "parse":
            let args = call.arguments as! [String: Any];
          let path = args["path"] as! String;
          let url =  URL(fileURLWithPath: path);

          let data = try! Data(contentsOf: url)
            let serialized = try! PropertyListSerialization.propertyList(from: data, options: [], format: nil) as! NSDictionary;
          result(serialized);

          return
        default:
          result(nil)
          return
        }
    })
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
