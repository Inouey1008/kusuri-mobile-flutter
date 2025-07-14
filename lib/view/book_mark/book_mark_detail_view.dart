
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../utils/utils.dart';
import '../widgets/indicator_view.dart';

class BookMarkDetailView extends StatefulWidget {
  const BookMarkDetailView({
    required this.url,
    this.title,
    Key? key,
  }) : super(key: key);

  final String url;
  final String? title;

  @override
  State<BookMarkDetailView> createState() => _BookMarkDetailViewState();
}

class _BookMarkDetailViewState extends State<BookMarkDetailView> {
  final WebViewController _controller = WebViewController();
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    _controller.setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          if (progress < 100) {
            _showIndicator();
          } else {
            _hideIndicator();
          }
        },
      ),
    );
    _controller.loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text('添付文書'),
        actions: [
          GestureDetector(
            onTap: () async {
              // final repo = FavoriteRepository();
              // final id = FirebaseAuth.instance.currentUser!.uid;
              // print(id);
              // final favo = FavoriteModel(id:  const Uuid().v4(), userID: id, productName: widget.title, genericName: widget.title, manufacturerName: widget.title, originalURL: widget.url, storageRefURL: null, createdAt: DateTime.now(), updatedAt: null, drugType: DrugType.medical);
              // repo.create(favorite: favo);
            },
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add),
                  Text('保存', style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
          ),
          SizedBox(
            width: DeviceUtil.switchValue(
              mobile: 8,
              tablet: 16,
            ),
          ),
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
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
          children: [
            WebViewWidget(
              controller: _controller,
            ),
            Visibility(
              visible: _loading,
              child: IndicatorView(loading: _loading),
            ),
          ],
        ),
      ),
    );
  }

  void _showIndicator() {
    if (!mounted) return;
    setState(() {
      _loading = true;
    });
  }

  void _hideIndicator() {
    if (!mounted) return;
    setState(() {
      _loading = false;
    });
  }
}
