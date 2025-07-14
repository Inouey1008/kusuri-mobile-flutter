import 'package:kusuri_mobile_flutter/enum/enum.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../utils/utils.dart';
import '../model/model.dart';
import '../repository/repository.dart';

part 'suggestion.g.dart';

@riverpod
class SuggestionList extends _$SuggestionList {
  @override
  FutureOr<List<DrugNameModel>> build() => [];

  Future<void> fetch({required String keyword}) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final tolowerCase = keyword.toLowerCase();
      final trim = tolowerCase.trim();
      final zenkaku = trim.hankakuToZenkaku();
      final searchString = zenkaku.katakanaToHiragana();
      final repository = ref.read(drugNameRepositoryProvider);

      if (searchString.isEmpty) {
        return [];
      } else {
        final prefix = await repository.fetchListByProcessedName(
          searchString: searchString,
          stringMatch: StringMatch.prefix,
        );

        final substring = await repository.fetchListByProcessedName(
          searchString: searchString,
          stringMatch: StringMatch.substring,
        );

        final suffix = await repository.fetchListByProcessedName(
          searchString: searchString,
          stringMatch: StringMatch.suffix,
        );

        final drugNameList = <DrugNameModel>[];
        drugNameList.addAll(prefix);
        drugNameList.addAll(substring);
        drugNameList.addAll(suffix);

        return drugNameList.toSet().toList();
      }
    });
  }
}
