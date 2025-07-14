import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class OnboardingPage2View extends StatelessWidget {
  const OnboardingPage2View({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      switch (orientation) {
        case Orientation.portrait:
          return const _PortraitLayout();
        case Orientation.landscape:
          return const _LandscapeLayout();
      }
    });
  }
}

class _PortraitLayout extends StatelessWidget {
  const _PortraitLayout();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: DeviceUtil.switchValue(
              mobile: 240,
              tablet: 420,
            ),
            height: DeviceUtil.switchValue(
              mobile: 240,
              tablet: 420,
            ),
            padding: EdgeInsets.all(
              DeviceUtil.switchValue(
                mobile: 24,
                tablet: 44,
              ),
            ),
            color: Colors.white,
            child: Image.asset(
              'assets/images/onboarding_02.png',
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: DeviceUtil.switchValue(
              mobile: 16,
              tablet: 24,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44),
                child: Text(
                  '医薬品名検索',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              SizedBox(
                height: DeviceUtil.switchValue(
                  mobile: 16,
                  tablet: 24,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  '検索したい医薬品名を入力して、添付文書を検索できます。',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LandscapeLayout extends StatelessWidget {
  const _LandscapeLayout();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: DeviceUtil.switchValue(
            mobile: 24,
            tablet: 44,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: DeviceUtil.switchValue(
                mobile: 240,
                tablet: 420,
              ),
              height: DeviceUtil.switchValue(
                mobile: 240,
                tablet: 420,
              ),
              padding: EdgeInsets.all(
                DeviceUtil.switchValue(
                  mobile: 24,
                  tablet: 44,
                ),
              ),
              color: Colors.white,
              child: Image.asset(
                'assets/images/onboarding_02.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: DeviceUtil.switchValue(
                mobile: 16,
                tablet: 24,
              ),
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 44),
                    child: Text(
                      '医薬品名検索',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  SizedBox(
                    height: DeviceUtil.switchValue(
                      mobile: 16,
                      tablet: 24,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      '検索したい医薬品名を入力して、添付文書を検索できます。',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
