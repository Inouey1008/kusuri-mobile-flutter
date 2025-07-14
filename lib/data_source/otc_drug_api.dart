import 'package:http/http.dart' as http;
import 'package:html/dom.dart';
import 'package:html/parser.dart';

import '../model/drug_model.dart';

class OtcDrugApi {
  Future<List<DrugModel>> searchByKeyword(String keyword) async {
    Map<String, dynamic> body = Map.of(_kSearchParams)..addAll({'nameWord': keyword});

    try {
      final response = await http.post(Uri.parse(_kURL), body: body);
      // !! DOM の内容を解析していく
      final dom = parse(response.body.toString());
      final drugList = _convertDomToDrugList(dom: dom);
      return drugList;
    } catch (error) {
      throw FormatException(error.toString());
    }
  }

  static const String _kURL = 'https://www.pmda.go.jp/PmdaSearch/otcSearch/';
  static const Map<String, dynamic> _kSearchParams = {'btnA.x': '0', 'btnA.y': '0', 'howtoMatchRadioValue': '1', 'tglOpFlg': '', 'dispColumnsList[0]': '1', 'dispColumnsList[1]': '2', 'dispColumnsList[2]': '11', 'dispColumnsList[3]': '6', 'effectValue': '', 'txtEffect': '', 'txtEffectHowtoSearch': 'and', 'cautions': '', 'cautionsHowtoSearch': 'and', 'updateDocFrDt': '年月日 [YYYYMMDD]', 'updateDocToDt': '年月日 [YYYYMMDD]', 'compNameWord': '', 'dosage': '', 'ingredient': '', 'ingredientNotInclude': '', 'additive': '', 'additiveNotInclude': '', 'risk': '', 'howtoRdSearchSel': 'or', 'relationDoc1Sel': '', 'relationDoc1check1': 'on', 'relationDoc1check2': 'on', 'relationDoc1Word': '検索語を入力', 'relationDoc1HowtoSearch': 'and', 'relationDoc1FrDt': '年月 [YYYYMM]', 'relationDoc1ToDt': '年月 [YYYYMM]', 'relationDocHowtoSearchBetween12': 'and', 'relationDoc2Sel': '', 'relationDoc2check1': 'on', 'relationDoc2check2': 'on', 'relationDoc2Word': '検索語を入力', 'relationDoc2HowtoSearch': 'and', 'relationDoc2FrDt': '年月 [YYYYMM]', 'relationDoc2ToDt': '年月 [YYYYMM]', 'relationDocHowtoSearchBetween23': 'and', 'relationDoc3Sel': '', 'relationDoc3check1': 'on', 'relationDoc3check2': 'on', 'relationDoc3Word': '検索語を入力', 'relationDoc3HowtoSearch': 'and', 'relationDoc3FrDt': '年月 [YYYYMM]', 'relationDoc3ToDt': '年月 [YYYYMM]', 'ListRows': '100', 'listCategory': ''};

  List<DrugModel> _convertDomToDrugList({required Document dom}) {
    final drugList = <DrugModel>[];

    const resultTableSelector = '#ResultList tr[class^=TrColor]';
    final List<Element> resultTableRows = dom.querySelectorAll(resultTableSelector);

    for (Element row in resultTableRows) {
      String genericName = '';
      String productName = '';
      String manufacturerName = '';
      String url = '';

      final List<Element> rowCells = row.querySelectorAll('td');
      for (int i = 0; i < rowCells.length; i++) {
        try {
          // 製品名
          if (i == 0) {
            const productNameSelector = 'a[href*="/PmdaSearch/otcDetail/GeneralList"]';
            productName = rowCells[i].querySelector(productNameSelector)?.text ?? '';
          }
          // 会社名
          else if (i == 1) {
            manufacturerName = rowCells[i].text;
          }
          // URL
          else if (i == 2) {
            const baseUrl = 'https://www.pmda.go.jp';
            const linkSelector = 'a[href*="/PmdaSearch/otcDetail/ResultDataSetPDF"]';
            final linkElement = rowCells[i].querySelector(linkSelector);
            final hrefAttribute = linkElement?.attributes['href'] ?? '';
            if (hrefAttribute.isNotEmpty) {
              url = baseUrl + hrefAttribute;
            }
          } else {
            // 何もしない
          }
          // ignore: empty_catches
        } catch (e) {}
      }

      if (productName.isNotEmpty && manufacturerName.isNotEmpty && url.isNotEmpty) {
        final drug = DrugModel(
          genericName: genericName,
          productName: productName,
          manufacturerName: manufacturerName,
          url: url,
        );
        drugList.add(drug);
      }
    }
    return drugList;
  }
}
