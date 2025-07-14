import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../provider/provider.dart';
import '../../utils/utils.dart';

class ThemeSelector extends ConsumerWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(context, ref) {
    final themeMode = ref.watch(themeSettingProvider);

    return DropdownButtonHideUnderline(
      child: DropdownButton2<ThemeMode>(
        customButton: Icon(
          switch (themeMode) {
            ThemeMode.light => Icons.light_mode,
            ThemeMode.dark => Icons.dark_mode,
            ThemeMode.system => Icons.brightness_6,
          },
          size: DeviceUtil.switchValue(
            mobile: 24,
            tablet: 30,
          ),
        ),
        items: [
          DropdownMenuItem<ThemeMode>(
            value: ThemeMode.light,
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                Icons.light_mode,
                size: DeviceUtil.switchValue(
                  mobile: 24,
                  tablet: 30,
                ),
              ),
              title: const Text('ライトモード'),
            ),
          ),
          DropdownMenuItem<ThemeMode>(
            value: ThemeMode.dark,
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                Icons.dark_mode,
                size: DeviceUtil.switchValue(
                  mobile: 24,
                  tablet: 30,
                ),
              ),
              title: const Text('ダークモード'),
            ),
          ),
          DropdownMenuItem<ThemeMode>(
            value: ThemeMode.system,
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                Icons.brightness_6,
                size: DeviceUtil.switchValue(
                  mobile: 24,
                  tablet: 30,
                ),
              ),
              title: const Text('システム設定'),
            ),
          ),
        ],
        onChanged: (value) {
          if (value != null) {
            ref.read(themeSettingProvider.notifier).update(value);
          }
        },
        dropdownStyleData: DropdownStyleData(
          direction: DropdownDirection.left,
          width: DeviceUtil.switchValue(
            mobile: 200,
            tablet: 260,
          ),
          padding: EdgeInsets.all(
            DeviceUtil.switchValue(
              mobile: 4,
              tablet: 16,
            ),
          ),
          elevation: 6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
