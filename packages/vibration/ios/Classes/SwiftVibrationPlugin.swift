import Flutter
import UIKit
import AudioToolbox

public class SwiftVibrationPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "com.gaetschwartz.vibration/channel", binaryMessenger: registrar.messenger())
        let instance = SwiftVibrationPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if (call.method == "vibrate"){
            let args = call.arguments as! String
           // print(args)
            if(args == "selection"){
                
                if #available(iOS 10.0, *) {
                    let selection = UISelectionFeedbackGenerator()
                    selection.selectionChanged()
                } else {
                    // Fallback on earlier versions
                }
            } else if(args == "light"){
                if #available(iOS 10.0, *) {
                    let selection = UIImpactFeedbackGenerator(style: .light)
                    selection.impactOccurred()
                } else {
                    // Fallback on earlier versions
                }
            } else if(args == "medium"){
                if #available(iOS 10.0, *) {
                    let selection = UIImpactFeedbackGenerator(style: .medium)
                    selection.impactOccurred()
                } else {
                    // Fallback on earlier versions
                }
            } else if(args == "heavy"){
                if #available(iOS 10.0, *) {
                    let selection = UIImpactFeedbackGenerator(style: .heavy)
                    selection.impactOccurred()
                } else {
                    // Fallback on earlier versions
                }
            } else if(args == "rigid"){
                if #available(iOS 13.0, *) {
                    let selection = UIImpactFeedbackGenerator(style: .rigid)
                    selection.impactOccurred()
                } else {
                    // Fallback on earlier versions
                    if #available(iOS 10.0, *) {
                        let selection = UIImpactFeedbackGenerator(style: .medium)
                        selection.impactOccurred()
                    }
                } 
            } else if(args == "soft"){
                if #available(iOS 13.0, *) {
                    let selection = UIImpactFeedbackGenerator(style: .soft)
                    selection.impactOccurred()
                } else {
                    // Fallback on earlier versions
                    if #available(iOS 10.0, *) {
                        let selection = UIImpactFeedbackGenerator(style: .medium)
                        selection.impactOccurred()
                    }
                }
            } else if(args == "success"){
                if #available(iOS 10.0, *) {
                    let notification = UINotificationFeedbackGenerator()
                    notification.notificationOccurred(.success)
                } else {
                    // Fallback on earlier versions
                }
            }
            else if(args == "warning"){
                if #available(iOS 10.0, *) {
                    let notification = UINotificationFeedbackGenerator()
                    notification.notificationOccurred(.warning)
                } else {
                    // Fallback on earlier versions
                }
            }
            else if(args == "error"){
                if #available(iOS 10.0, *) {
                    let notification = UINotificationFeedbackGenerator()
                    notification.notificationOccurred(.error)
                } else {
                    // Fallback on earlier versions
                }
            }
            else if(args == "normal"){
                if #available(iOS 10.0, *) {
                    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
                } else {
                    // Fallback on earlier versions
                }
            }
        }
    }
}
