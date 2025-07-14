import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_util.dart';
import 'device_util.dart';

class ThemeUtil {
  static T switchValue<T>({
    required BuildContext context,
    required T light,
    required T dark,
  }) {
    return switch (Theme.of(context).brightness) {
      Brightness.light => light,
      Brightness.dark => dark,
    };
  }

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      primaryColor: ColorUtil.accentLight,
      cardTheme: const CardTheme(
        clipBehavior: Clip.antiAlias,
        color: ColorUtil.backGroundBaseLight,
        elevation: 1,
        surfaceTintColor: Colors.transparent,
        shadowColor: ColorUtil.weakGrey,
      ),
      indicatorColor: ColorUtil.accentDark,
      scaffoldBackgroundColor: ColorUtil.backGroundCoverLight,
      fontFamily: GoogleFonts.notoSansJp.toString(),
      iconTheme: IconThemeData(
        size: DeviceUtil.switchValue(
          mobile: 20,
          tablet: 25,
        ),
        color: ColorUtil.normalGrey,
      ),
      searchViewTheme: SearchViewThemeData(
        backgroundColor: ColorUtil.backGroundBaseLight,
        elevation: 1,
        surfaceTintColor: Colors.transparent,
        dividerColor: ColorUtil.weakGrey,
        headerTextStyle: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 16,
            tablet: 26,
          ),
          fontWeight: FontWeight.normal,
          color: ColorUtil.textLight,
        ),
      ),
      searchBarTheme: SearchBarThemeData(
        backgroundColor: const MaterialStatePropertyAll(
          ColorUtil.backGroundBaseLight,
        ),
        surfaceTintColor: const MaterialStatePropertyAll(
          Colors.transparent,
        ),
        elevation: const MaterialStatePropertyAll(1),
        hintStyle: MaterialStatePropertyAll(
          TextStyle(
            fontSize: DeviceUtil.switchValue(
              mobile: 14,
              tablet: 22,
            ),
            fontWeight: FontWeight.w200,
            color: ColorUtil.textLight,
          ),
        ),
        textStyle: MaterialStatePropertyAll(
          TextStyle(
            fontSize: DeviceUtil.switchValue(
              mobile: 16,
              tablet: 26,
            ),
            fontWeight: FontWeight.normal,
            color: ColorUtil.textLight,
          ),
        ),
      ),
      listTileTheme: ListTileThemeData(
        titleTextStyle: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 16,
            tablet: 26,
          ),
          fontWeight: FontWeight.normal,
          color: ColorUtil.textLight,
        ),
        subtitleTextStyle: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 12,
            tablet: 20,
          ),
          fontWeight: FontWeight.w200,
          color: ColorUtil.textLight,
        ),
        visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity,
        ),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 20,
            tablet: 30,
          ),
          fontWeight: FontWeight.normal,
          color: ColorUtil.strongTextLight,
        ),
        backgroundColor: ColorUtil.backGroundBaseLight,
        scrolledUnderElevation: 1,
        shadowColor: ColorUtil.weakGrey,
        elevation: 1,
        surfaceTintColor: Colors.transparent,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: ColorUtil.backGroundBaseLight,
        selectedItemColor: ColorUtil.accentLight,
        elevation: 1,
        landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
      ),
      dividerColor: ColorUtil.weakestGrey,
      brightness: Brightness.light,
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: ColorUtil.accentLight,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: ColorUtil.accentLight,
          backgroundColor: Colors.transparent,
          side: const BorderSide(
            color: ColorUtil.accentLight,
            width: 1.5,
          ),
          elevation: 0,
          surfaceTintColor: Colors.transparent,
        ),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 28,
            tablet: 40,
          ),
          fontWeight: FontWeight.bold,
          color: ColorUtil.textLight,
        ),
        displayMedium: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 28,
            tablet: 40,
          ),
          fontWeight: FontWeight.normal,
          color: ColorUtil.textLight,
        ),
        displaySmall: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 28,
            tablet: 40,
          ),
          fontWeight: FontWeight.w200,
          color: ColorUtil.textLight,
        ),
        headlineLarge: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 24,
            tablet: 35,
          ),
          fontWeight: FontWeight.bold,
          color: ColorUtil.textLight,
        ),
        headlineMedium: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 24,
            tablet: 35,
          ),
          fontWeight: FontWeight.normal,
          color: ColorUtil.textLight,
        ),
        headlineSmall: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 24,
            tablet: 35,
          ),
          fontWeight: FontWeight.w200,
          color: ColorUtil.textLight,
        ),
        titleLarge: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 20,
            tablet: 30,
          ),
          fontWeight: FontWeight.bold,
          color: ColorUtil.textLight,
        ),
        titleMedium: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 20,
            tablet: 30,
          ),
          fontWeight: FontWeight.normal,
          color: ColorUtil.textLight,
        ),
        titleSmall: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 20,
            tablet: 30,
          ),
          fontWeight: FontWeight.w200,
          color: ColorUtil.textLight,
        ),
        labelLarge: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 16,
            tablet: 25,
          ),
          fontWeight: FontWeight.bold,
          color: ColorUtil.textLight,
        ),
        labelMedium: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 16,
            tablet: 25,
          ),
          fontWeight: FontWeight.normal,
          color: ColorUtil.textLight,
        ),
        labelSmall: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 16,
            tablet: 25,
          ),
          fontWeight: FontWeight.w200,
          color: ColorUtil.textLight,
        ),
        bodyLarge: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 12,
            tablet: 20,
          ),
          fontWeight: FontWeight.bold,
          color: ColorUtil.textLight,
        ),
        bodyMedium: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 12,
            tablet: 20,
          ),
          fontWeight: FontWeight.normal,
          color: ColorUtil.textLight,
        ),
        bodySmall: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 12,
            tablet: 20,
          ),
          fontWeight: FontWeight.w200,
          color: ColorUtil.textLight,
        ),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          visualDensity: VisualDensity(
            horizontal: DeviceUtil.switchValue(
              mobile: VisualDensity.minimumDensity,
              tablet: VisualDensity.compact.horizontal,
            ),
            vertical: DeviceUtil.switchValue(
              mobile: VisualDensity.minimumDensity,
              tablet: VisualDensity.compact.vertical,
            ),
          ),
          side: const MaterialStatePropertyAll(
            BorderSide(
              color: ColorUtil.weakGrey,
              width: 1,
            ),
          ),
          elevation: const MaterialStatePropertyAll(0),
          surfaceTintColor: const MaterialStatePropertyAll(
            Colors.transparent,
          ),
        ),
      ),
      tabBarTheme: TabBarTheme(
        dividerHeight: 0,
        indicatorColor: ColorUtil.accentLight,
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 16,
            tablet: 25,
          ),
          fontWeight: FontWeight.normal,
          color: ColorUtil.strongTextLight,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 16,
            tablet: 25,
          ),
          fontWeight: FontWeight.normal,
          color: ColorUtil.strongTextLight,
        ),
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      primaryColor: ColorUtil.accentDark,
      cardTheme: const CardTheme(
        clipBehavior: Clip.antiAlias,
        color: ColorUtil.backGroundBaseDark,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        shadowColor: ColorUtil.weakestGrey,
      ),
      indicatorColor: ColorUtil.accentDark,
      scaffoldBackgroundColor: ColorUtil.backGroundCoverDark,
      fontFamily: GoogleFonts.notoSansJp.toString(),
      iconTheme: IconThemeData(
        size: DeviceUtil.switchValue(
          mobile: 20,
          tablet: 25,
        ),
        color: ColorUtil.strongGrey,
      ),
      searchViewTheme: SearchViewThemeData(
        backgroundColor: ColorUtil.backGroundBaseDark,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        dividerColor: ColorUtil.strongGrey,
        headerTextStyle: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 16,
            tablet: 26,
          ),
          fontWeight: FontWeight.normal,
          color: ColorUtil.textDark,
        ),
      ),
      searchBarTheme: SearchBarThemeData(
        backgroundColor:
            const MaterialStatePropertyAll(ColorUtil.backGroundBaseDark),
        surfaceTintColor: const MaterialStatePropertyAll(
          Colors.transparent,
        ),
        elevation: const MaterialStatePropertyAll(0),
        hintStyle: MaterialStatePropertyAll(
          TextStyle(
            fontSize: DeviceUtil.switchValue(
              mobile: 14,
              tablet: 22,
            ),
            fontWeight: FontWeight.w200,
            color: ColorUtil.weakTextDark,
          ),
        ),
        textStyle: MaterialStatePropertyAll(
          TextStyle(
            fontSize: DeviceUtil.switchValue(
              mobile: 16,
              tablet: 26,
            ),
            fontWeight: FontWeight.normal,
            color: ColorUtil.textDark,
          ),
        ),
      ),
      listTileTheme: ListTileThemeData(
        titleTextStyle: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 16,
            tablet: 26,
          ),
          fontWeight: FontWeight.normal,
          color: ColorUtil.textDark,
        ),
        subtitleTextStyle: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 12,
            tablet: 20,
          ),
          fontWeight: FontWeight.w200,
          color: ColorUtil.textDark,
        ),
        visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity,
        ),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 20,
            tablet: 30,
          ),
          fontWeight: FontWeight.normal,
          color: ColorUtil.strongTextDark,
        ),
        backgroundColor: ColorUtil.backGroundBaseDark,
        scrolledUnderElevation: 0,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: ColorUtil.backGroundBaseDark,
        selectedItemColor: ColorUtil.accentDark,
        elevation: 0,
        landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
      ),
      dividerColor: ColorUtil.weakestGrey,
      brightness: Brightness.dark,
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: ColorUtil.accentDark,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: ColorUtil.accentDark,
          backgroundColor: Colors.transparent,
          side: const BorderSide(color: ColorUtil.accentDark, width: 1.5),
          elevation: 0,
          surfaceTintColor: Colors.transparent,
        ),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 28,
            tablet: 40,
          ),
          fontWeight: FontWeight.bold,
          color: ColorUtil.textDark,
        ),
        displayMedium: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 28,
            tablet: 40,
          ),
          fontWeight: FontWeight.normal,
          color: ColorUtil.textDark,
        ),
        displaySmall: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 28,
            tablet: 40,
          ),
          fontWeight: FontWeight.w200,
          color: ColorUtil.textDark,
        ),
        headlineLarge: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 24,
            tablet: 35,
          ),
          fontWeight: FontWeight.bold,
          color: ColorUtil.textDark,
        ),
        headlineMedium: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 24,
            tablet: 35,
          ),
          fontWeight: FontWeight.normal,
          color: ColorUtil.textDark,
        ),
        headlineSmall: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 24,
            tablet: 35,
          ),
          fontWeight: FontWeight.w200,
          color: ColorUtil.textDark,
        ),
        titleLarge: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 20,
            tablet: 30,
          ),
          fontWeight: FontWeight.bold,
          color: ColorUtil.textDark,
        ),
        titleMedium: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 20,
            tablet: 30,
          ),
          fontWeight: FontWeight.normal,
          color: ColorUtil.textDark,
        ),
        titleSmall: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 20,
            tablet: 30,
          ),
          fontWeight: FontWeight.w200,
          color: ColorUtil.textDark,
        ),
        labelLarge: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 16,
            tablet: 25,
          ),
          fontWeight: FontWeight.bold,
          color: ColorUtil.textDark,
        ),
        labelMedium: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 16,
            tablet: 25,
          ),
          fontWeight: FontWeight.normal,
          color: ColorUtil.textDark,
        ),
        labelSmall: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 16,
            tablet: 25,
          ),
          fontWeight: FontWeight.w200,
          color: ColorUtil.textDark,
        ),
        bodyLarge: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 12,
            tablet: 20,
          ),
          fontWeight: FontWeight.bold,
          color: ColorUtil.textDark,
        ),
        bodyMedium: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 12,
            tablet: 20,
          ),
          fontWeight: FontWeight.normal,
          color: ColorUtil.textDark,
        ),
        bodySmall: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 12,
            tablet: 20,
          ),
          fontWeight: FontWeight.w200,
          color: ColorUtil.textDark,
        ),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          visualDensity: VisualDensity(
            horizontal: DeviceUtil.switchValue(
              mobile: VisualDensity.minimumDensity,
              tablet: VisualDensity.compact.horizontal,
            ),
            vertical: DeviceUtil.switchValue(
              mobile: VisualDensity.minimumDensity,
              tablet: VisualDensity.compact.vertical,
            ),
          ),
          side: const MaterialStatePropertyAll(
            BorderSide(color: ColorUtil.strongestGrey, width: 1),
          ),
          elevation: const MaterialStatePropertyAll(0),
        ),
      ),
      tabBarTheme: TabBarTheme(
        dividerHeight: 0,
        indicatorColor: ColorUtil.accentDark,
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 16,
            tablet: 25,
          ),
          fontWeight: FontWeight.normal,
          color: ColorUtil.strongTextDark,
        ),
        //labelPadding: EdgeInsets.zero,
        unselectedLabelStyle: TextStyle(
          fontSize: DeviceUtil.switchValue(
            mobile: 16,
            tablet: 25,
          ),
          fontWeight: FontWeight.normal,
          color: ColorUtil.strongTextDark,
        ),
      ),
    );
  }
}
