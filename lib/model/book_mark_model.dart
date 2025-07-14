import 'package:freezed_annotation/freezed_annotation.dart';

import '../enum/enum.dart';
import '../utils/utils.dart';

part 'book_mark_model.freezed.dart';
part 'book_mark_model.g.dart';

@freezed
class BookMarkModel with _$BookMarkModel {
  const factory BookMarkModel({
    required String id,
    required String userID,
    required String? productName,
    required String? genericName,
    required String? manufacturerName,
    required String? originalURL,
    required String? storageRefURL,
    required DrugType? drugType,
    @ISODateTimeConverter() required DateTime? createdAt,
    @ISODateTimeConverter() required DateTime? updatedAt,
  }) = _BookMarkModel;

  factory BookMarkModel.fromJson(Map<String, dynamic> json) => _$BookMarkModelFromJson(json);

  static List<BookMarkModel> listFromJson(List<dynamic> jsonList) {
    final result = <BookMarkModel>[];
    if (jsonList.isNotEmpty) {
      for (final json in jsonList) {
        final value = BookMarkModel.fromJson(json);
        result.add(value);
      }
    }
    return result.toList();
  }
}
