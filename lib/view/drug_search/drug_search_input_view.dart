import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../provider/provider.dart';

class DrugSearchInputView extends HookConsumerWidget {
  const DrugSearchInputView({
    this.initialValue,
    this.onChanged,
    this.onSubmitted,
    super.key,
  });

  final String? initialValue;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;

  @override
  Widget build(context, ref) {
    final textEditingController = useTextEditingController(text: initialValue ?? '');
    final scrollController = useScrollController();
    final suggestions = ref.watch(suggestionListProvider).value;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              onChanged: (input) async {
                onChanged?.call(input);
                ref.read(suggestionListProvider.notifier).fetch(keyword: input);
              },
              onSubmitted: (input) {
                onSubmitted?.call(input);
                FocusScope.of(context).unfocus();
                Navigator.pop(context);
              },
              style: Theme.of(context).textTheme.titleMedium,
              textInputAction: TextInputAction.search,
              keyboardType: TextInputType.text,
              autofocus: true,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      Navigator.pop(context);
                    },
                  ),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => textEditingController.clear(),
                  ),
                ),
                labelStyle: Theme.of(context).textTheme.titleLarge,
                hintText: "医薬品名を入力",
                hintStyle: Theme.of(context).textTheme.titleSmall,
                contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              ),
            ),
            Expanded(
              child: Scrollbar(
                controller: scrollController,
                child: ListView.builder(
                  shrinkWrap: false,
                  controller: scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  itemCount: suggestions?.length ?? 0,
                  itemBuilder: (context, index) {
                    final suggestion = suggestions?[index];
                    if (suggestion != null) {
                      return ListTile(
                        title: Text(suggestion.originalName ?? ''),
                        onTap: () {
                          onSubmitted?.call(suggestion.originalName ?? '');
                          FocusScope.of(context).unfocus();
                          Navigator.pop(context);
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
