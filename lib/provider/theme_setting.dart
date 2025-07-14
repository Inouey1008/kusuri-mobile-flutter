import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data_source/shared_preferences_factory.dart';

part 'theme_setting.g.dart';

@riverpod
class ThemeSetting extends _$ThemeSetting {
  @override
  ThemeMode build() {
    final savedValue = SharedPreferencesFactory.instance.getString(_key);

    if (savedValue == null) {
      SharedPreferencesFactory.instance.setString(_key, _defaultValue.name);
      return _defaultValue;
    } else {
      return ThemeMode.values.byName(savedValue);
    }
  }

  static const String _key = 'them-mode';
  static const ThemeMode _defaultValue = ThemeMode.system;

  void update(ThemeMode updateValue) {
    state = updateValue;
    SharedPreferencesFactory.instance.setString(_key, updateValue.name);
  }
}

