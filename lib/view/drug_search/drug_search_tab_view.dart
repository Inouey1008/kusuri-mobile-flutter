// import 'package:flutter/material.dart';
//
// import '../widgets/theme_selector.dart';
// import 'drug_search_view.dart';
//
// class DrugSearchTabView extends StatelessWidget {
//   const DrugSearchTabView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       initialIndex: 0,
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('検索'),
//           actions: const [
//             ThemeSelector(),
//             SizedBox(width: 16),
//           ],
//           bottom: const PreferredSize(
//             preferredSize: Size.fromHeight(44),
//             child: SizedBox(
//               height: 44,
//               child: TabBar(
//                 tabs: [
//                   Tab(text: '医療用医薬品'),
//                   Tab(text: '一般用医薬品'),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             const MedicalDrugSearchView(),
//             Container(),
//             // MedicalDrugInfoSearchView(),
//           ],
//         ),
//       ),
//     );
//   }
// }
