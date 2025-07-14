import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/model.dart';
import '../../provider/provider.dart';
import '../../utils/utils.dart';
import '../widgets/empty_state_view.dart';
import '../widgets/indicator_view.dart';
import 'book_mark_detail_view.dart';

class BookMarkListView extends HookConsumerWidget {
  const BookMarkListView({super.key});

  @override
  Widget build(context, ref) {
    final scrollController = useScrollController();
    final bookMarkList = ref.watch(bookMarkListProvider);

    return Stack(
      fit: StackFit.expand,
      children: [
        Column(
          children: [
            SizedBox(
              height: DeviceUtil.switchValue(
                mobile: 16,
                tablet: 22,
              ),
            ),
            SizedBox(
              height: DeviceUtil.switchValue(
                mobile: 8,
                tablet: 12,
              ),
            ),
            Expanded(
              child: bookMarkList.when(
                data: (data) => Builder(builder: (_) {
                   if (data.isEmpty) {
                    return const EmptyStateView(
                      iconData: Icons.question_mark,
                      title: 'ブックマークはありません',
                    );
                  } else {
                    return Scrollbar(
                      controller: scrollController,
                      thumbVisibility: true,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        shrinkWrap: false,
                        controller: scrollController,
                        physics: const AlwaysScrollableScrollPhysics(),
                        clipBehavior: Clip.hardEdge,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final bookMark = data[index];
                          return BookMarkCard(
                            bookMark: bookMark,
                            onClicked: () {
                              Navigator.of(context, rootNavigator: true).push(
                                // !! 共通化したいところ
                                PageRouteBuilder(
                                  pageBuilder: (context, animation, secondaryAnimation) {
                                    return BookMarkDetailView(
                                      title: bookMark.productName ?? '',
                                      url: bookMark.originalURL ?? '',
                                    );
                                  },
                                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                    final tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
                                    final curveTween = CurveTween(curve: Curves.ease);
                                    return SlideTransition(
                                      position: animation.drive(tween.chain(curveTween)),
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                    );
                  }
                }),
                error: (error, st) => Container(color: Colors.yellow),
                loading: () => const SizedBox(),
              ),
            ),
          ],
        ),
        Visibility(
          visible: bookMarkList.isLoading,
          child: IndicatorView(loading: bookMarkList.isLoading),
        ),
      ],
    );
  }
}

class BookMarkCard extends StatelessWidget {
  const BookMarkCard({super.key, required this.bookMark, this.onClicked});

  final BookMarkModel bookMark;
  final VoidCallback? onClicked;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: onClicked,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(bookMark.productName ?? '', style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 8),
              Text(bookMark.manufacturerName ?? '', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
