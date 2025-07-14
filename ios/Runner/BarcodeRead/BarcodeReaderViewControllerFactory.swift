//
//  BarcodeReaderViewControllerFactory.swift
//  Runner
//
//  Created by Yusuke Inoue on 2024/05/18.
//

import Foundation
import Flutter
import UIKit
import AVFoundation
import RxSwift
import RxCocoa
import SnapKit
import Vision

class MyCustomViewControllerFactory: NSObject, FlutterPlatformViewFactory {
    private var controller: FlutterViewController
    
    init(controller: FlutterViewController) {
        self.controller = controller
        super.init()
    }
    
    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        return MyCustomViewControllerWrapper(
            frame: frame,
            viewId: viewId,
            controller: controller
        )
    }
}

class MyCustomViewControllerWrapper: NSObject, FlutterPlatformView {
    private var _viewController: MyCustomViewController

    init(
        frame: CGRect,
        viewId: Int64,
        controller: FlutterViewController
    ) {
        _viewController = MyCustomViewController()
        controller.addChild(_viewController)
        _viewController.previewArea.frame = frame
        controller.view.addSubview(_viewController.previewArea)
        _viewController.didMove(toParent: controller)
        super.init()
    }

    func view() -> UIView {
        return _viewController.previewArea
    }
}

//
//class SwiftUIViewFactory: NSObject, FlutterPlatformViewFactory {
//    private var messenger: FlutterBinaryMessenger
//
//    init(messenger: FlutterBinaryMessenger) {
//        self.messenger = messenger
//        super.init()
//    }
//
//    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
//        return SwiftUIView(frame: frame, viewIdentifier: viewId, arguments: args, binaryMessenger: messenger)
//    }
//}

class SwiftUIViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger

    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }

    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return SwiftUIView(frame: frame, viewIdentifier: viewId, arguments: args, binaryMessenger: messenger)
    }
}



class SwiftUIView: NSObject, FlutterPlatformView {
    private var _view: UIView
    private var previewLayer: AVCaptureVideoPreviewLayer?

    init(frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?, binaryMessenger messenger: FlutterBinaryMessenger) {
        _view = UIView(frame: frame)
        super.init()
        checkCameraPermission()
        
        let channel = FlutterMethodChannel(name: "cameraView_\(viewId)", binaryMessenger: messenger)
        channel.setMethodCallHandler { [weak self] (call, result) in
            if call.method == "testMethod" {
                result("Test method called successfully")
            } else {
                result(FlutterMethodNotImplemented)
            }
        }
    }

    func view() -> UIView {
        return _view
    }

    private func checkCameraPermission() {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        switch status {
        case .authorized:
            setupCameraView()
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    DispatchQueue.main.async {
                        self.setupCameraView()
                    }
                }
            }
        case .denied, .restricted:
            break
        @unknown default:
            break
        }
    }

    private func setupCameraView() {
        let session = AVCaptureSession()
        session.sessionPreset = .photo

        guard let device = AVCaptureDevice.default(for: .video),
              let input = try? AVCaptureDeviceInput(device: device) else {
            return
        }

        let output = AVCaptureVideoDataOutput()
        output.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: Int(kCVPixelFormatType_32BGRA)]
        output.alwaysDiscardsLateVideoFrames = true

        if session.canAddInput(input) && session.canAddOutput(output) {
            session.addInput(input)
            session.addOutput(output)
        }

        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.frame = _view.bounds

        DispatchQueue.main.async {
            self._view.layer.addSublayer(previewLayer)
            self.previewLayer = previewLayer
        }

        DispatchQueue.global(qos: .userInitiated).async {
            session.startRunning()
        }
    }
}
