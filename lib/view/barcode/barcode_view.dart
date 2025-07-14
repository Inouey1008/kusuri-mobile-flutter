import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

class BarcodeView extends StatefulHookConsumerWidget {
  const BarcodeView({super.key});

  @override
  ConsumerState<BarcodeView> createState() => _BarcodeViewState();
}

class _BarcodeViewState extends ConsumerState<BarcodeView> {
  @override
  Widget build(BuildContext context) {
    // This is the platform view identifier
    const String viewType = 'cameraView';
    // Pass parameters to the platform view
    final Map<String, dynamic> creationParams = <String, dynamic>{};

    return UiKitView(
      viewType: viewType,
      creationParams: creationParams,
      creationParamsCodec: const StandardMessageCodec(),
      onPlatformViewCreated: (int id) {
        print('Native view created with id: $id');
        final channel = MethodChannel('cameraView_$id');
        channel.invokeMethod('testMethod').then((result) {
          print('Result from native: $result');
        });
      },
    );
  }
  // String _status = "Unknown";
  //
  // Future<void> _checkCameraPermission() async {
  //   var status = await Permission.camera.status;
  //   if (status.isGranted) {
  //     setState(() {
  //       _status = "Permission Granted";
  //     });
  //   } else if (status.isDenied) {
  //     setState(() {
  //       _status = "Permission Denied";
  //     });
  //   } else if (status.isPermanentlyDenied) {
  //     setState(() {
  //       _status = "Permission Permanently Denied";
  //     });
  //   }
  // }
  //
  // Future<void> _requestCameraPermission() async {
  //   var status = await Permission.videos.request();
  //   if (status.isGranted) {
  //     setState(() {
  //       _status = "Permission Granted";
  //     });
  //   } else if (status.isDenied) {
  //     setState(() {
  //       _status = "Permission Denied";
  //     });
  //   } else if (status.isPermanentlyDenied) {
  //     setState(() {
  //       _status = "Permission Permanently Denied";
  //     });
  //     openAppSettings();
  //   }
  // }
  //
  //
  // @override
  // Widget build(context) {
  //
  //   useEffect(() {
  //     final status = Permission.camera.request().then((value) {
  //       if (value.isGranted) {
  //         print("Camera permission granted");
  //       } else {
  //         print("Camera permission denied");
  //       }
  //     });
  //
  //   }, []);
  //
  //   // return Stack(
  //   //   fit: StackFit.expand,
  //   //   children: [
  //   //     Column(
  //   //       mainAxisAlignment: MainAxisAlignment.center,
  //   //       children: <Widget>[
  //   //         Text('Camera Permission Status: $_status'),
  //   //         const SizedBox(
  //   //           height: 200,
  //   //           child: UiKitView(
  //   //             viewType: 'my_custom_view_controller',
  //   //             creationParams: <String, dynamic>{},
  //   //             creationParamsCodec: StandardMessageCodec(),
  //   //           ),
  //   //         ),
  //   //         ElevatedButton(
  //   //           onPressed: _checkCameraPermission,
  //   //           child: Text('Check Permission'),
  //   //         ),
  //   //         ElevatedButton(
  //   //           onPressed: _requestCameraPermission,
  //   //           child: Text('Request Permission'),
  //   //         ),
  //   //       ],
  //   //     ),
  //   //   ],
  //   // );
  //
  //   // return UiKitView(
  //   //   viewType: 'cameraView',
  //   //   creationParams: <String, dynamic>{},
  //   //   creationParamsCodec: StandardMessageCodec(),
  //   // );
  //
  //   // return UiKitView(
  //   //   viewType: 'cameraView',
  //   //   // onPlatformViewCreated: _onPlatformViewCreated,
  //   // );
  // }
}
