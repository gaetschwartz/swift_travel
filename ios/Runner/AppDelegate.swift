import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    private var methodChannel: FlutterMethodChannel?
    
    private var eventChannel: FlutterEventChannel?
    
    private let linkStreamHandler = LinkStreamHandler()
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        
        let controller = window.rootViewController as! FlutterViewController
        methodChannel = FlutterMethodChannel(name: "com.gaetanschwartz.swiss_travel.deeplink/channel", binaryMessenger: controller as! FlutterBinaryMessenger)
        
        methodChannel?.setMethodCallHandler({ (call: FlutterMethodCall, result: FlutterResult) in
                                                guard call.method == "initialLink" else {
                                                    result(FlutterMethodNotImplemented)
                                                    return
                                                }})
        
        
        self.eventChannel = FlutterEventChannel(name: "com.gaetanschwartz.swiss_travel.deeplink/events", binaryMessenger: controller as! FlutterBinaryMessenger)
        
        GeneratedPluginRegistrant.register(with: self)
        self.eventChannel?.setStreamHandler(self.linkStreamHandler)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        eventChannel?.setStreamHandler(linkStreamHandler)
        return linkStreamHandler.handleLink(url.absoluteString)
    }
    
    
    //quick_actions item click not work, should copy this method to AppDelegate.swift�
    @available(iOS 9.0, *)
    override func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        let controller = window.rootViewController as? FlutterViewController
        
        let channel = FlutterMethodChannel(name: "plugins.flutter.io/quick_actions", binaryMessenger: controller! as! FlutterBinaryMessenger)
        channel.invokeMethod("launch", arguments: shortcutItem.type)
    }
}

class LinkStreamHandler:NSObject, FlutterStreamHandler {
    
    var eventSink: FlutterEventSink?
    
    // links will be added to this queue until the sink is ready to process them
    var queuedLinks = [String]()
    
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        self.eventSink = events
        queuedLinks.forEach({ events($0) })
        queuedLinks.removeAll()
        return nil
    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        self.eventSink = nil
        return nil
    }
    
    func handleLink(_ link: String) -> Bool {
        guard let eventSink = eventSink else {
            queuedLinks.append(link)
            return false
        }
        eventSink(link)
        return true
    }
}
