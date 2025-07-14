
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data_source/shared_preferences_factory.dart';
import '../enum/enum.dart';

part 'onboarding.g.dart';

@riverpod
class Onboarding extends _$Onboarding {
  @override
  OnboardingStatus build() {
    final savedValue = SharedPreferencesFactory.instance.getString(_key);

    if (savedValue == null) {
      SharedPreferencesFactory.instance.setString(_key, _defaultValue.name);
      return _defaultValue;
    } else {
      return OnboardingStatus.values.byName(savedValue);
    }
  }

  static const String _key = 'onboarding-status';
  static const OnboardingStatus _defaultValue = OnboardingStatus.inProgress;

  void update(OnboardingStatus updateValue) {
    state = updateValue;
    SharedPreferencesFactory.instance.setString(_key, updateValue.name);
  }
}

