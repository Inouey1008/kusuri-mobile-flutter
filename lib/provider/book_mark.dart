
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'provider.dart';
import '../model/model.dart';
import '../repository/repository.dart';

part 'book_mark.g.dart';

@riverpod
class BookMarkList extends _$BookMarkList {
  @override
  FutureOr<List<BookMarkModel>> build() {
    final BookMarkRepository repository = ref.read(bookMarkRepositoryProvider);
    final uid = ref.watch(authenticatedUserProvider).value?.uid;
    if (uid == null) {
      return [];
    } else {
      return repository.fetchByUser(userID: uid);
    }
  }

  Future<void> add({required BookMarkModel bookMark}) async {
    state = const AsyncValue.loading();
    await ref.read(bookMarkRepositoryProvider).create(bookMark: bookMark);
    ref.invalidateSelf();
  }
}
