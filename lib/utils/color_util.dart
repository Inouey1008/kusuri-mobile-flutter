import 'package:flutter/material.dart';

class ColorUtil {
  static const Color weakAccentLight = Color(0xFFC0CCE7);
  static const Color weakAccentDark = Color(0xFFC0CCE7);

  static const Color accentLight = Color(0xFF4267B3);
  static const Color accentDark = Color(0xFF429AFF);

  static const Color strongAccentLight = Color(0xFF23388E);
  static const Color strongAccentDark = Color(0xFF2338F4);

  static const Color weakTextLight = Color(0xFF878787);
  static const Color weakTextDark = Color(0xFF9A9A9A);

  static const Color textLight = Color(0xFF444444);
  static const Color textDark = Color(0xFFDDDDDD);

  static const Color strongTextLight = Color(0xFF333333);
  static const Color strongTextDark = Color(0xFFFFFFFF);

  static const Color backGroundBaseLight = Color(0xFFF8F8F8);
  static const Color backGroundBaseDark = Color(0xFF282828);

  static const Color backGroundCoverLight = Color(0xFFF1F1F1);
  static const Color backGroundCoverDark = Color(0xFF000000);

  static const Color weakestGrey = Color(0xFFDDDDDD);
  static const Color weakGrey = Color(0xFFCCCCCC);
  static const Color normalGrey = Color(0xFFAAAAAA);
  static const Color strongGrey = Color(0xFF878787);
  static const Color strongestGrey = Color(0xFF444444);

  static T selectValue<T>({required BuildContext context, required T forLight, required T forDark}) {
    final brightness = Theme.of(context).brightness;
    switch (brightness) {
      case Brightness.light:
        return forLight;
      case Brightness.dark:
        return forDark;
    }
  }
}
