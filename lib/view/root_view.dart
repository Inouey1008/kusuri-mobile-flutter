import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

import '../enum/enum.dart';
import '../provider/provider.dart';
import 'home_tab/home_tab_view.dart';
import 'onboarding/onboarding_view.dart';

class RootView extends ConsumerWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final user = ref.watch(authenticatedUserProvider);  // !! State の初期化のみ行う。
    Logger().d("AuthenticatedUser: ${user.value?.uid}");

    final onboardingStatus = ref.watch(onboardingProvider);

    return Container(
      color: Colors.white,
      child: Builder(builder: (context) {
        switch (onboardingStatus) {
          case OnboardingStatus.inProgress:
            return OnboardingView();
          case OnboardingStatus.completed:
            return const HomeTabView();
        }
      }),
    );
  }
}
