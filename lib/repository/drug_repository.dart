import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/model.dart';
import '../data_source/date_source.dart';

part 'drug_repository.g.dart';

@riverpod
DrugRepository drugRepository(DrugRepositoryRef ref) => DrugRepository();

class DrugRepository {
  Future<List<DrugModel>> fetchMedicalDrugList({required String keyword}) async {
    final apiClient = MedicalDrugApi();
    final drugInfoModelList = await apiClient.searchByKeyword(keyword);
    return drugInfoModelList;
  }

  Future<List<DrugModel>> fetchOtcDrugList({required String keyword}) async {
    final apiClient = OtcDrugApi();
    final drugList = await apiClient.searchByKeyword(keyword);
    return drugList;
  }
}
