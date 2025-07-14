
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:collection/collection.dart';
import 'package:uuid/uuid.dart';

import 'provider.dart';
import '../enum/enum.dart';
import '../model/model.dart';
import '../repository/repository.dart';

part 'medical_drug.g.dart';

@riverpod
class MedicalDrugList extends _$MedicalDrugList {
  @override
  FutureOr<List<DrugModel>?> build() => null;

  Future<void> search(String keyword) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final drugList = await ref
          .read(drugRepositoryProvider)
          .fetchMedicalDrugList(keyword: keyword);

      final bookMarkList = ref.watch(bookMarkListProvider).value;

      drugList.map((drug) {
        final bookMark = bookMarkList
            ?.firstWhereOrNull((bookMark) => drug.url == bookMark.originalURL);

        return drug.copyWith(bookmarked: bookMark != null);
      });

      return drugList;
    });
  }

  Future<void> bookMark({required DrugModel drug}) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final user = ref.watch(authenticatedUserProvider).value;
      if (user == null) throw Exception('');

      final bookMark = BookMarkModel(
        id: const Uuid().v4(),
        userID: user.uid,
        productName: drug.productName,
        genericName: drug.genericName,
        manufacturerName: drug.manufacturerName,
        originalURL: drug.url,
        storageRefURL: null,
        drugType: DrugType.medical,
        updatedAt: DateTime.now(),
        createdAt: DateTime.now(),
      );

      await ref.read(bookMarkRepositoryProvider).create(bookMark: bookMark);
      ref.invalidateSelf();
    });
  }
}
