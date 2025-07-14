import 'package:freezed_annotation/freezed_annotation.dart';

part 'drug_model.freezed.dart';
part 'drug_model.g.dart';

@freezed
class DrugModel with _$DrugModel {
  const factory DrugModel({
    required String? productName,
    required String? genericName,
    required String? manufacturerName,
    required String? url,
    bool? bookmarked,
  }) = _DrugModel;

  factory DrugModel.fromJson(Map<String, dynamic> json) => _$DrugModelFromJson(json);

  static List<DrugModel> listFromJson(List<dynamic> jsonList) {
    final result = <DrugModel>[];
    if (jsonList.isNotEmpty) {
      for (final json in jsonList) {
        final value = DrugModel.fromJson(json);
        result.add(value);
      }
    }
    return result.toList();
  }
}
