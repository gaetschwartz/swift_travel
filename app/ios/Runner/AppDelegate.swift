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
        methodChannel = FlutterMethodChannel(name: "com.gaetanschwartz.swift_travel.deeplink/channel", binaryMessenger: controller as! FlutterBinaryMessenger)
        
        methodChannel?.setMethodCallHandler({ (call: FlutterMethodCall, result: FlutterResult) in
                                                guard call.method == "initialLink" else {
                                                    result(FlutterMethodNotImplemented)
                                                    return
                                                }})
        
        
        self.eventChannel = FlutterEventChannel(name: "com.gaetanschwartz.swift_travel.deeplink/events", binaryMessenger: controller as! FlutterBinaryMessenger)
        
        GeneratedPluginRegistrant.register(with: self)
        self.eventChannel?.setStreamHandler(self.linkStreamHandler)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        eventChannel?.setStreamHandler(linkStreamHandler)
        return linkStreamHandler.handleLink(url.absoluteString)
    }
    
    override func application(_ application: UIApplication,
                              continue userActivity: NSUserActivity,
                              restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool
    {
        eventChannel?.setStreamHandler(linkStreamHandler)
        // Get URL components from the incoming user activity.
        if (userActivity.activityType != NSUserActivityTypeBrowsingWeb) {return false}
        guard let incomingURL = userActivity.webpageURL else {return false}
        print("We have a new URL \(incomingURL)")
        return linkStreamHandler.handleLink(incomingURL.absoluteString)
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
