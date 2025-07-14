import 'package:sizer/sizer.dart';

class DeviceUtil {
  static T switchValue<T>({
    required T mobile,
    required T tablet,
  }) {
    return switch (SizerUtil.deviceType) {
      DeviceType.mobile => mobile,
      DeviceType.tablet => tablet,
      _ => mobile,
    };
  }
}
