import 'package:http/http.dart' as http;
import 'package:html/dom.dart';
import 'package:html/parser.dart';

import '../model/drug_model.dart';

class MedicalDrugApi {
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

  static const String _kURL = 'https://www.pmda.go.jp/PmdaSearch/iyakuSearch/';
  static const Map<String, dynamic> _kSearchParams = {'param1': 'value1', 'param2': 'value2', 'ListRows': '100', 'btnA.x': '0', 'btnA.y': '0', 'iyakuHowtoNameSearchRadioValue': '1', 'howtoMatchRadioValue': '1', 'tglOpFlg': '', 'dispColumnsList[0]': '1', 'dispColumnsList[1]': '2', 'dispColumnsList[2]': '3', 'dispColumnsList[3]': '23', 'dispColumnsList[4]': '25', 'dispColumnsList[7]': '4', 'dispColumnsList[8]': '11', 'effectValue': '', 'infoindicationsorefficacy': '', 'infoindicationsorefficacyHowtoSearch': 'and', 'warnings': '', 'warningsHowtoSearch': 'and', 'contraindicationsAvoidedadministration': '', 'contraindicationsAvoidedadministrationHowtoSearch': 'and', 'contraindicatedcombinationPrecautionsforcombination': '', 'contraindicatedcombinationPrecautionsforcombinationHowtoSearch': 'and', 'updateDocFrDt': '年月日 [YYYYMMDD]', 'updateDocToDt': '年月日 [YYYYMMDD]', 'compNameWord': '', 'iyakuKoumokuSelectSwitchRadio': '2', 'isNewReleaseDisp': 'true', 'koumoku1Value': '', 'koumoku1Word': '', 'koumoku1HowtoSearch': 'and', 'koumoku2Value': '', 'koumoku2Word': '', 'koumoku2HowtoSearch': 'and', 'koumoku3Value': '', 'koumoku3Word': '', 'koumoku3HowtoSearch': 'and', 'gs1code': '', 'howtoRdSearchSel': 'or', 'relationDoc1Sel': '', 'relationDoc1check1': 'on', 'relationDoc1check2': 'on', 'relationDoc1Word': '検索語を入力', 'relationDoc1HowtoSearch': 'and', 'relationDoc1FrDt': '年月 [YYYYMM]', 'relationDoc1ToDt': '年月 [YYYYMM]', 'relationDocHowtoSearchBetween12': 'and', 'relationDoc2Sel': '', 'relationDoc2check1': 'on', 'relationDoc2check2': 'on', 'relationDoc2Word': '検索語を入力', 'relationDoc2HowtoSearch': 'and', 'relationDoc2FrDt': '年月 [YYYYMM]', 'relationDoc2ToDt': '年月 [YYYYMM]', 'relationDocHowtoSearchBetween23': 'and', 'relationDoc3Sel': '', 'relationDoc3check1': 'on', 'relationDoc3check2': 'on', 'relationDoc3Word': '検索語を入力', 'relationDoc3HowtoSearch': 'and', 'relationDoc3FrDt': '年月 [YYYYMM]', 'relationDoc3ToDt': '年月 [YYYYMM]', 'listCategory': ''};

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
          // 一般名
          if (i == 0) {
            //print(rowCells[i].text);
            const genericNameSelector = 'a[href*="/PmdaSearch/iyakuDetail/GeneralList"]';
            genericName = rowCells[i].querySelector(genericNameSelector)?.text ?? '';
          }
          // 製品名
          else if (i == 1) {
            productName = rowCells[i].text;
          }
          // 会社名
          else if (i == 2) {
            manufacturerName = rowCells[i].text;
          }
          // URL
          else if (i == 3) {
            const baseUrl = 'https://www.pmda.go.jp';
            const linkSelector = 'a[href*="/PmdaSearch/iyakuDetail/ResultDataSetPDF"]';
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

      if (genericName.isNotEmpty && productName.isNotEmpty && manufacturerName.isNotEmpty && url.isNotEmpty) {
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
