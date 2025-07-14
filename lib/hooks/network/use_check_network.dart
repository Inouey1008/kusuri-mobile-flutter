import 'package:connecteo/connecteo.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

(bool?, Future<bool> Function()) useCheckNetwork() {
  final isOnline = useState<bool?>(null);
  final connectionChecker = ConnectionChecker();

  Future<bool> checkNetwork() async {
    isOnline.value = null; // initialize
    final isConnected = await connectionChecker.isConnected;
    isOnline.value = isConnected;
    return isConnected;
  }

  return (isOnline.value, checkNetwork);
}
