import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kusuri_mobile_flutter/view/barcode/barcode_view.dart';
import 'package:kusuri_mobile_flutter/view/book_mark/book_mark_list_view.dart';
import 'package:kusuri_mobile_flutter/view/drug_search/drug_search_view.dart';

import '../../utils/utils.dart';
import '../drug_search/drug_search_tab_view.dart';
import '../menu/menu_view.dart';

class HomeTabView extends HookWidget {
  const HomeTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabIndex = useState<int>(0);

    return Scaffold(
      body: IndexedStack(
        index: tabIndex.value,
        children: const [
          // DrugSearchTabView(),
          BarcodeView(),
          MedicalDrugSearchView(),
          // BookMarkListView(),
          // BookMarkListView(),

          // DrugSearchTabView(),
          MenuView(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: ThemeUtil.switchValue(
              context: context,
              light: ColorUtil.weakestGrey,
              dark: Colors.transparent,
            ),
            blurRadius: DeviceUtil.switchValue(
              mobile: 6,
              tablet: 12,
            ),
            spreadRadius: 0.5,
          ),
        ]),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.search), label: '検索'),
            // BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'ブックマーク'),
            BottomNavigationBarItem(icon: Icon(Icons.camera_alt_outlined), label: 'バーコード'),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'メニュー'),
          ],
          currentIndex: tabIndex.value,
          onTap: (int index) => tabIndex.value = index,
          iconSize: DeviceUtil.switchValue(
            mobile: 24,
            tablet: 32,
          ),
          selectedFontSize: DeviceUtil.switchValue(
            mobile: 14,
            tablet: 22,
          ),
          unselectedFontSize: DeviceUtil.switchValue(
            mobile: 12,
            tablet: 20,
          ),
        ),
      ),
    );
  }
}


//
// import 'package:flutter/material.dart';
//
// /// Flutter code sample for [SearchBar].
//
// void main() => runApp(const SearchBarApp());
//
// class SearchBarApp extends StatefulWidget {
//   const SearchBarApp({super.key});
//
//   @override
//   State<SearchBarApp> createState() => _SearchBarAppState();
// }
//
// class _SearchBarAppState extends State<SearchBarApp> {
//   bool isDark = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final ThemeData themeData = ThemeData(
//         useMaterial3: true,
//         brightness: isDark ? Brightness.dark : Brightness.light);
//
//     return MaterialApp(
//       theme: themeData,
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Search Bar Sample')),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: SearchAnchor(
//               builder: (BuildContext context, SearchController controller) {
//                 return SearchBar(
//                   controller: controller,
//                   padding: const MaterialStatePropertyAll<EdgeInsets>(
//                       EdgeInsets.symmetric(horizontal: 16.0)),
//                   onTap: () {
//                     controller.openView();
//                   },
//                   onChanged: (_) {
//                     controller.openView();
//                   },
//                   leading: const Icon(Icons.search),
//                   trailing: <Widget>[
//                     Tooltip(
//                       message: 'Change brightness mode',
//                       child: IconButton(
//                         isSelected: isDark,
//                         onPressed: () {
//                           setState(() {
//                             isDark = !isDark;
//                           });
//                         },
//                         icon: const Icon(Icons.wb_sunny_outlined),
//                         selectedIcon: const Icon(Icons.brightness_2_outlined),
//                       ),
//                     )
//                   ],
//                 );
//               }, suggestionsBuilder:
//               (BuildContext context, SearchController controller) {
//             return List<ListTile>.generate(5, (int index) {
//               final String item = 'item $index';
//               return ListTile(
//                 title: Text(item),
//                 onTap: () {
//                   setState(() {
//                     controller.closeView(item);
//                   });
//                 },
//               );
//             });
//           }),
//         ),
//       ),
//     );
//   }
// }
