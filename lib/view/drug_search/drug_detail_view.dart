import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../provider/provider.dart';
import '../../model/model.dart';
import '../../enum/enum.dart';
import '../../utils/utils.dart';
import '../widgets/indicator_view.dart';

class DrugDetailView extends HookConsumerWidget {
  DrugDetailView({
    required this.drug,
    Key? key,
  }) : super(key: key);

  final DrugModel drug;
  final WebViewController controller = WebViewController();

  @override
  Widget build(context, ref) {
    final loading = useState<bool>(true);

    useEffect(() {
      controller.setBackgroundColor(const Color(0xff000000));
      controller.setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) async {
            if (progress < 100) {
              loading.value = true;
            } else {
              const duration = Duration(milliseconds: 500);
              await Future.delayed(duration); // !! ページ読み込み完了ですぐに表示すると画面がカクつくので、遅延させる
              loading.value = false;
            }
          },
        ),
      );
      controller.loadRequest(Uri.parse(drug.url ?? ''));
    }, []);

    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text('添付文書'),
        actions: [
          IconButton(
            onPressed: () async {
              final uid = ref.read(authenticatedUserProvider).value?.uid;
              if (uid == null) return;

              loading.value = true;

              final bookMark = BookMarkModel(
                id: const Uuid().v4(),
                userID: uid,
                productName: drug.productName,
                genericName: drug.genericName,
                manufacturerName: drug.manufacturerName,
                originalURL: drug.url,
                storageRefURL: null,
                drugType: DrugType.medical,
                updatedAt: DateTime.now(),
                createdAt: DateTime.now(),
              );

              await ref.read(bookMarkListProvider.notifier).add(bookMark: bookMark);

              loading.value = false;
            },
            visualDensity: const VisualDensity(horizontal: VisualDensity.minimumDensity),
            icon: const Icon(Icons.bookmark_add),
          ),
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            visualDensity: const VisualDensity(horizontal: VisualDensity.minimumDensity),
            icon: const Icon(CupertinoIcons.xmark_circle_fill),
          ),
          SizedBox(
            width: DeviceUtil.switchValue(
              mobile: 8,
              tablet: 16,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          fit: StackFit.expand,
          children: [
            WebViewWidget(
              controller: controller,
            ),
            Visibility(
              visible: loading.value,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Theme.of(context).scaffoldBackgroundColor,
                child: IndicatorView(loading: loading.value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
