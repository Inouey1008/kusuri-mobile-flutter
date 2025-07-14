import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../enum/enum.dart';
import '../../provider/provider.dart';
import '../../utils/utils.dart';
import 'onboarding_page1_view.dart';
import 'onboarding_page2_view.dart';
import 'onboarding_page3_view.dart';
import 'onboarding_page4_view.dart';

class OnboardingView extends HookConsumerWidget {
  OnboardingView({super.key});

  final _controller = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = useState<int>(0);
    final onboardingStatus = ref.read(onboardingProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: DeviceUtil.switchValue(
                mobile: 52,
                tablet: 66,
              ),
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: DeviceUtil.switchValue(
                  mobile: 16,
                  tablet: 24,
                ),
              ),
              child: Row(
                children: [
                  const Spacer(),
                  IconButton(
                    icon: Icon(
                      CupertinoIcons.xmark_circle_fill,
                      size: DeviceUtil.switchValue(
                        mobile: 30,
                        tablet: 40,
                      ),
                      color: ColorUtil.normalGrey,
                    ),
                    onPressed: () => onboardingStatus.update(OnboardingStatus.completed),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: DeviceUtil.switchValue(
                mobile: 16,
                tablet: 24,
              ),
            ),
            Expanded(
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _controller,
                children: const [
                  OnboardingPage1View(),
                  OnboardingPage2View(),
                  OnboardingPage3View(),
                  OnboardingPage4View(),
                ],
                onPageChanged: (index) {
                  pageIndex.value = index;
                },
              ),
            ),
            SizedBox(
              width: DeviceUtil.switchValue(
                mobile: 16,
                tablet: 24,
              ),
            ),
            DotsIndicator(
              dotsCount: 4,
              position: pageIndex.value,
              axis: Axis.horizontal,
            ),
            SizedBox(
              height: DeviceUtil.switchValue(
                mobile: 16,
                tablet: 24,
              ),
            ),
            Container(
              height: 44,
              margin: EdgeInsets.symmetric(
                horizontal: DeviceUtil.switchValue(
                  mobile: 24,
                  tablet: 100,
                ),
              ),
              child: IndexedStack(
                index: pageIndex.value,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      child: const Text('次へ進む'),
                      onPressed: () => _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => _controller.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          ),
                          child: const Text('戻る'),
                        ),
                      ),
                      SizedBox(
                        width: DeviceUtil.switchValue(
                          mobile: 16,
                          tablet: 44,
                        ),
                      ),
                      Expanded(
                        child: FilledButton(
                          onPressed: () => _controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          ),
                          child: const Text('次へ進む'),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => _controller.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          ),
                          child: const Text('戻る'),
                        ),
                      ),
                      SizedBox(
                        width: DeviceUtil.switchValue(
                          mobile: 16,
                          tablet: 44,
                        ),
                      ),
                      Expanded(
                        child: FilledButton(
                          onPressed: () => _controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          ),
                          child: const Text('次へ進む'),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => _controller.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          ),
                          child: const Text('戻る'),
                        ),
                      ),
                      SizedBox(
                        width: DeviceUtil.switchValue(
                          mobile: 16,
                          tablet: 44,
                        ),
                      ),
                      Expanded(
                        child: FilledButton(
                          onPressed: () => onboardingStatus.update(OnboardingStatus.completed),
                          child: const Text('はじめる'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: DeviceUtil.switchValue(
                mobile: 24,
                tablet: 44,
              ),
            )
          ],
        ),
      ),
    );
  }
}
