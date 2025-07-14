import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data_source/database_factory.dart';
import '../model/model.dart';
import '../../enum/enum.dart';

part 'drug_name_repository.g.dart';

@riverpod
DrugNameRepository drugNameRepository(DrugNameRepositoryRef ref) => DrugNameRepository();

class DrugNameRepository {
  final _database = DatabaseFactory.instance;
  final _table = 'drug_name';

  Future<List<DrugNameModel>> fetchListByOriginalName({required String searchString, required StringMatch stringMatch}) async {
    final List<String> whereArgs = switch (stringMatch) {
      StringMatch.prefix => ['$searchString%'],
      StringMatch.substring => ['%$searchString%'],
      StringMatch.suffix => ['%$searchString'],
    };

    final jsonList = await _database.query(_table, where: 'original_name LIKE ?', whereArgs: whereArgs);

    return DrugNameModel.listFromJson(jsonList);
  }

  Future<List<DrugNameModel>> fetchListByProcessedName({required String searchString, required StringMatch stringMatch}) async {
    final List<String> whereArgs = switch (stringMatch) {
      StringMatch.prefix => ['$searchString%'],
      StringMatch.substring => ['%$searchString%'],
      StringMatch.suffix => ['%$searchString'],
    };

    final jsonList = await _database.query(_table, where: 'processed_name LIKE ?', whereArgs: whereArgs);

    return DrugNameModel.listFromJson(jsonList);
  }

  Future<List<DrugNameModel>> fetchRandomList({int? limit = 100}) async {
    final jsonList = await _database.rawQuery('SELECT * FROM $_table ORDER BY RANDOM() LIMIT $limit');
    return DrugNameModel.listFromJson(jsonList);
  }
}
