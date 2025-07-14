import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

String? useVersion() {
  final version = useState<String?>(null);

  Future<void> fetchVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    version.value = packageInfo.version;
  }

  useEffect(() {
    fetchVersion();
  }, []);

  return version.value;
}
