// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_mark_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookMarkModelImpl _$$BookMarkModelImplFromJson(Map<String, dynamic> json) =>
    _$BookMarkModelImpl(
      id: json['id'] as String,
      userID: json['userID'] as String,
      productName: json['productName'] as String?,
      genericName: json['genericName'] as String?,
      manufacturerName: json['manufacturerName'] as String?,
      originalURL: json['originalURL'] as String?,
      storageRefURL: json['storageRefURL'] as String?,
      drugType: $enumDecodeNullable(_$DrugTypeEnumMap, json['drugType']),
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['createdAt'], const ISODateTimeConverter().fromJson),
      updatedAt: _$JsonConverterFromJson<String, DateTime>(
          json['updatedAt'], const ISODateTimeConverter().fromJson),
    );

Map<String, dynamic> _$$BookMarkModelImplToJson(_$BookMarkModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userID': instance.userID,
      'productName': instance.productName,
      'genericName': instance.genericName,
      'manufacturerName': instance.manufacturerName,
      'originalURL': instance.originalURL,
      'storageRefURL': instance.storageRefURL,
      'drugType': _$DrugTypeEnumMap[instance.drugType],
      'createdAt': _$JsonConverterToJson<String, DateTime>(
          instance.createdAt, const ISODateTimeConverter().toJson),
      'updatedAt': _$JsonConverterToJson<String, DateTime>(
          instance.updatedAt, const ISODateTimeConverter().toJson),
    };

const _$DrugTypeEnumMap = {
  DrugType.medical: 'medical',
  DrugType.otc: 'otc',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
