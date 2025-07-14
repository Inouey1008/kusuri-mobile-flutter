import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

import 'env/firebase_options_dev.dart' as development;
import 'env/firebase_options_prod.dart' as production;
import 'provider/provider.dart';
import 'utils/utils.dart';
import 'data_source/date_source.dart';
import 'view/root_view.dart';

FirebaseOptions firebaseOptions() {
  const flavor = String.fromEnvironment('FLAVOR');
  switch (flavor) {
    case 'dev':
      return development.DefaultFirebaseOptions.currentPlatform;
    case 'prod':
      return production.DefaultFirebaseOptions.currentPlatform;
    default:
      throw ArgumentError('Not available flavor');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(name: const String.fromEnvironment('FLAVOR'), options: firebaseOptions());
  await SharedPreferencesFactory.setup();
  await DatabaseFactory.setup();
  await Permission.camera.request();
  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final themeSetting = ref.watch(themeSettingProvider);

    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeUtil.light,
        darkTheme: ThemeUtil.dark,
        themeMode: themeSetting,
        home: MediaQuery.withNoTextScaling(
          child: const RootView(),
        ),
      ),
    );
  }
}
