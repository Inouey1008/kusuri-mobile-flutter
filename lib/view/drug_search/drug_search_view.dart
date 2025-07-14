import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../provider/provider.dart';
import '../../utils/utils.dart';
import '../widgets/empty_state_view.dart';
import '../widgets/indicator_view.dart';
import '../widgets/theme_selector.dart';
import 'drug_card.dart';
import 'drug_detail_view.dart';
import 'drug_search_input_view.dart';

class MedicalDrugSearchView extends HookConsumerWidget {
  const MedicalDrugSearchView({super.key});

  @override
  Widget build(context, ref) {
    final scrollController = useScrollController();
    final drugList = ref.watch(medicalDrugListProvider);
    final searchController = useSearchController();
    final focusNode = useFocusNode();

    return Scaffold(
      appBar: AppBar(
        title: const Text('検索'),
        actions: const [
          ThemeSelector(),
          SizedBox(width: 16),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(focusNode),
        child: Stack(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: MaterialButton(
                    color: Theme.of(context).cardTheme.color,
                    clipBehavior: Clip.hardEdge,
                    visualDensity: VisualDensity.compact,
                    height: DeviceUtil.switchValue(
                      mobile: 44,
                      tablet: 56,
                    ),
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        DeviceUtil.switchValue(
                          mobile: 22,
                          tablet: 28,
                        ),
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pushWithoutAnimation(builder: (context) {
                      return DrugSearchInputView(
                        initialValue: searchController.text,
                        onChanged: (input) => searchController.text = input,
                        onSubmitted: (input) {
                          searchController.text = input;
                          ref.read(medicalDrugListProvider.notifier).search(input);
                        },
                      );
                    }),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 8,
                          ),
                          child: Icon(Icons.search),
                        ),
                        Expanded(
                          child: TextField(
                            enabled: false,
                            controller: searchController,
                            decoration: const InputDecoration(
                              hintText: "医薬品名を入力",
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 8),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => searchController.clear(),
                          icon: const Icon(Icons.clear),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: DeviceUtil.switchValue(
                    mobile: 8,
                    tablet: 12,
                  ),
                ),
                Expanded(
                  child: drugList.when(
                    data: (data) => Builder(builder: (_) {
                      if (data == null) {
                        return const EmptyStateView(
                          iconData: Icons.medication_rounded,
                          title: '医療用医薬品を検索する',
                          description: '医療用医薬品の添付文書を検索します',
                        );
                      } else if (data.isEmpty) {
                        return const EmptyStateView(
                          iconData: Icons.question_mark,
                          title: '検索結果が0件あるいは1000件以上でした',
                          description: '検索ワードを変えてもう一度お試しください',
                        );
                      } else {
                        return Scrollbar(
                          controller: scrollController,
                          thumbVisibility: false,
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            shrinkWrap: false,
                            controller: scrollController,
                            physics: const AlwaysScrollableScrollPhysics(),
                            clipBehavior: Clip.hardEdge,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              final drug = data[index];
                              return DrugCard(
                                drug: drug,
                                onClicked: () {
                                  Navigator.of(
                                    context,
                                    rootNavigator: true,
                                  ).pushWithModalAnimation(
                                    builder: (_) => DrugDetailView(drug: drug),
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
              visible: drugList.isLoading,
              child: IndicatorView(loading: drugList.isLoading),
            ),
          ],
        ),
      ),
    );
  }
}
