import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class EmptyStateView extends StatelessWidget {
  const EmptyStateView({
    super.key,
    required this.iconData,
    required this.title,
    this.description,
  });

  final IconData iconData;
  final String title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        DeviceUtil.switchValue(
          mobile: 32,
          tablet: 64,
        ),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: DeviceUtil.switchValue(
                  mobile: 56,
                  tablet: 116,
                ),
                color: ThemeUtil.switchValue(
                  context: context,
                  light: ColorUtil.weakTextLight,
                  dark: ColorUtil.weakTextDark,
                ),
              ),
              SizedBox(
                height: DeviceUtil.switchValue(
                  mobile: 32,
                  tablet: 64,
                ),
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: ThemeUtil.switchValue(
                        context: context,
                        light: ColorUtil.weakTextLight,
                        dark: ColorUtil.weakTextDark,
                      ),
                    ),
              ),
              if (description != null && description!.isNotEmpty)
                Column(
                  children: [
                    SizedBox(
                      height: DeviceUtil.switchValue(
                        mobile: 16,
                        tablet: 32,
                      ),
                    ),
                    Text(
                      description ?? '',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: ThemeUtil.switchValue(
                              context: context,
                              light: ColorUtil.weakTextLight,
                              dark: ColorUtil.weakTextDark,
                            ),
                          ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
