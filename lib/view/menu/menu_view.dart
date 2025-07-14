import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import 'dart:io';

import '../../provider/provider.dart';
import '../../utils/utils.dart';
import '../../hooks/version/use_version.dart';
import '../widgets/theme_selector.dart';

class MenuView extends HookConsumerWidget {
  const MenuView({super.key});

  @override
  Widget build(context, ref) {
    final scrollController = ScrollController();
    final version = useVersion();
    final themeSetting = ref.watch(themeSettingProvider);
    final themeSettingNotifier = ref.read(themeSettingProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('メニュー'),
        actions: const [
          ThemeSelector(),
          SizedBox(width: 16),
        ],
      ),
      body: Scrollbar(
        controller: scrollController,
        thumbVisibility: true,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          physics: const AlwaysScrollableScrollPhysics(),
          controller: scrollController,
          children: [
            const SizedBox(height: 24),
            // Row(
            //   children: [
            //     const SizedBox(width: 16),
            //     Text('設定', style: Theme.of(context).textTheme.bodyMedium),
            //   ],
            // ),
            // const SizedBox(height: 8),
            // Card(
            //   child: Column(
            //     children: [
                  // InkWell(
                  //   onTap: () {},
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  //     child: Row(
                  //       children: [
                  //         Text('データの保存・引き継ぎ', style: Theme.of(context).textTheme.labelMedium),
                  //         const Spacer(),
                  //         const Icon(Icons.navigate_next),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // const Divider(height: 1, indent: 24),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  //   child: Row(
                  //     children: [
                  //       Text('テーマ', style: Theme.of(context).textTheme.labelMedium),
                  //       const Spacer(),
                  //       SegmentedButton(
                  //         segments: [
                  //           ButtonSegment(
                  //             value: ThemeMode.light,
                  //             icon: Icon(
                  //               Icons.light_mode,
                  //               size: DeviceUtil.switchValue(
                  //                 mobile: 24,
                  //                 tablet: 30,
                  //               ),
                  //               color: themeSetting == ThemeMode.light ? ColorUtil.accentLight : ColorUtil.strongGrey,
                  //             ),
                  //           ),
                  //           ButtonSegment(
                  //             value: ThemeMode.dark,
                  //             icon: Icon(
                  //               Icons.dark_mode,
                  //               size: DeviceUtil.switchValue(
                  //                 mobile: 24,
                  //                 tablet: 30,
                  //               ),
                  //               color: themeSetting == ThemeMode.dark ? ColorUtil.weakAccentDark : ColorUtil.strongGrey,
                  //             ),
                  //           ),
                  //           ButtonSegment(
                  //             value: ThemeMode.system,
                  //             icon: Icon(
                  //               Icons.brightness_6,
                  //               size: DeviceUtil.switchValue(
                  //                 mobile: 24,
                  //                 tablet: 30,
                  //               ),
                  //               color: themeSetting == ThemeMode.system
                  //                   ? ThemeUtil.switchValue(
                  //                       context: context,
                  //                       light: ColorUtil.accentLight,
                  //                       dark: ColorUtil.weakAccentDark,
                  //                     )
                  //                   : ColorUtil.strongGrey,
                  //             ),
                  //           ),
                  //         ],
                  //         selected: {themeSetting},
                  //         showSelectedIcon: false,
                  //         onSelectionChanged: (newMode) => themeSettingNotifier.update(newMode.first),
                  //       )
                  //     ],
                  //   ),
                  // ),
            //     ],
            //   ),
            // ),
            // const SizedBox(height: 24),
            Row(
              children: [
                const SizedBox(width: 16),
                Text('サポート', style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            const SizedBox(height: 8),
            Card(
              child: Column(
                children: [
                  InkWell(
                    onTap: () => _openBrowser(url: 'https://forms.gle/8mjR8ds8cuwMPRcf9'),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      child: Row(
                        children: [
                          Text('お問い合わせ', style: Theme.of(context).textTheme.labelMedium),
                          const Spacer(),
                          const Icon(Icons.open_in_new),
                        ],
                      ),
                    ),
                  ),
                  const Divider(height: 1, indent: 24),
                  InkWell(
                    onTap: () {
                      if (Platform.isAndroid) {
                        launchUrl(
                          Uri.parse('https://play.google.com/store/apps/details?id=com.yusinoue.kusuri&showAllReviews=true'),
                          mode: LaunchMode.externalApplication,
                        );
                      } else if (Platform.isIOS) {
                        launchUrl(
                          Uri.parse('https://apps.apple.com/us/app/id1622959628?action=write-review'),
                          mode: LaunchMode.externalApplication,
                        );
                      } else {
                        // 何もしない
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      child: Row(
                        children: [
                          Text('レビューを書く', style: Theme.of(context).textTheme.labelMedium),
                          const Spacer(),
                          const Icon(Icons.open_in_new),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                const SizedBox(width: 16),
                Text('アプリについて', style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            const SizedBox(height: 8),
            Card(
              child: Column(
                children: [
                  InkWell(
                    onTap: () => _openBrowser(url: 'https://sites.google.com/view/kusuri-app/use-terms'),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      child: Row(
                        children: [
                          Text('利用規約', style: Theme.of(context).textTheme.labelMedium),
                          const Spacer(),
                          const Icon(Icons.open_in_new),
                        ],
                      ),
                    ),
                  ),
                  const Divider(height: 1, indent: 24),
                  InkWell(
                    onTap: () => _openBrowser(url: 'https://sites.google.com/view/kusuri-app/privacy-policy'),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      child: Row(
                        children: [
                          Text('プライバシーポリシー', style: Theme.of(context).textTheme.labelMedium),
                          const Spacer(),
                          const Icon(Icons.open_in_new),
                        ],
                      ),
                    ),
                  ),
                  const Divider(height: 1, indent: 24),
                  InkWell(
                    onTap: () async {
                      await Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(fullscreenDialog: true, builder: (_) => const LicensePage()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      child: Row(
                        children: [
                          Text('ライセンス', style: Theme.of(context).textTheme.labelMedium),
                          const Spacer(),
                          const Icon(Icons.navigate_next),
                        ],
                      ),
                    ),
                  ),
                  const Divider(height: 1, indent: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Row(
                      children: [
                        Text('バージョン', style: Theme.of(context).textTheme.labelMedium),
                        const Spacer(),
                        Text(version ?? '-', style: Theme.of(context).textTheme.titleSmall),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Future<void> _openBrowser({required String url}) async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView);
  }
}
