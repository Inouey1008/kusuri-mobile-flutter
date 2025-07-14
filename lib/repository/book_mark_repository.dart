
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/model.dart';

part 'book_mark_repository.g.dart';

@riverpod
BookMarkRepository bookMarkRepository(BookMarkRepositoryRef ref) => BookMarkRepository();

class BookMarkRepository {
  final _collection = FirebaseFirestore.instance.collection('bookMarks');

  Future<List<BookMarkModel>> fetchAll() async {
    final response = await _collection.get();
    final jsonList = response.docs.map((doc) => doc.data()).toList();

    if (jsonList.isEmpty) {
      return <BookMarkModel>[];
    } else {
      return BookMarkModel.listFromJson(jsonList);
    }
  }

  Stream<List<BookMarkModel>> fetchAllSnapshots() {
    final snapShots = _collection.snapshots();
    return snapShots.map((snapshot) {
      return snapshot.docs.map((doc) => BookMarkModel.fromJson(doc.data())).toList();
    });
  }

  Future<List<BookMarkModel>> fetchByUser({required String userID}) async {
    final documents = _collection.where('userID', isEqualTo: userID);
    final response = await documents.get();
    final jsonList = response.docs.map((doc) => doc.data()).toList();

    if (jsonList.isEmpty) {
      return <BookMarkModel>[];
    } else {
      return BookMarkModel.listFromJson(jsonList);
    }
  }

  Stream<List<BookMarkModel>> fetchByUserSnapshots({required String userID}) {
    final snapShots = _collection.where('userID', isEqualTo: userID).snapshots();
    return snapShots.map((snapshot) {
      return snapshot.docs.map((doc) => BookMarkModel.fromJson(doc.data())).toList();
    });
  }

  Future<BookMarkModel?> fetch({required String id}) async {
    final document = _collection.doc(id);
    final response = await document.get();
    final json = response.data();

    if (json == null) {
      return null;
    } else {
      return BookMarkModel.fromJson(json);
    }
  }

  Stream<BookMarkModel?> fetchSnapShot({required String id}) {
    final snapShots = _collection.doc(id).snapshots();
    return snapShots.map((doc) {
      final json = doc.data();

      if (json == null) {
        return null;
      } else {
        return BookMarkModel.fromJson(json);
      }
    });
  }

  Future<void> update({required BookMarkModel bookMark}) async {
    final document = _collection.doc(bookMark.id);
    await document.update(bookMark.toJson());
  }

  Future<void> create({required BookMarkModel bookMark}) async {
    final document = _collection.doc(bookMark.id);
    await document.set(bookMark.toJson());
  }

  Future<void> delete({required String id}) async {
    final document = _collection.doc(id);
    await document.delete();
  }
}
