import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      
      
      
      
      
//    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
//    let registrar = controller.registrar(forPlugin: "my_plugin")
//              
//    let factory = MyCustomViewControllerFactory(controller: controller)
//    registrar!.register(factory, withId: "my_custom_view_controller")
//      
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let factory = SwiftUIViewFactory(messenger: controller.binaryMessenger)
    registrar(forPlugin: "cameraView")?.register(
      factory,
      withId: "cameraView"
    )
      
              
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
