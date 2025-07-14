import 'package:freezed_annotation/freezed_annotation.dart';

part 'drug_name_model.freezed.dart';
part 'drug_name_model.g.dart';

@freezed
class DrugNameModel with _$DrugNameModel {
  const factory DrugNameModel({
    @JsonKey(name: 'original_name')
    required String? originalName,
    @JsonKey(name: 'processed_name')
    required String? processedName,
  }) = _DrugNameModel;

  factory DrugNameModel.fromJson(Map<String, dynamic> json) => _$DrugNameModelFromJson(json);

  static List<DrugNameModel> listFromJson(List<dynamic> jsonList) {
    final result = <DrugNameModel>[];
    if (jsonList.isNotEmpty) {
      for (final json in jsonList) {
        final value = DrugNameModel.fromJson(json);
        result.add(value);
      }
    }
    return result.toList();
  }
}
