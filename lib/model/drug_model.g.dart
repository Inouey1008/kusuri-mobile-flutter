// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drug_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DrugModelImpl _$$DrugModelImplFromJson(Map<String, dynamic> json) =>
    _$DrugModelImpl(
      productName: json['productName'] as String?,
      genericName: json['genericName'] as String?,
      manufacturerName: json['manufacturerName'] as String?,
      url: json['url'] as String?,
      bookmarked: json['bookmarked'] as bool?,
    );

Map<String, dynamic> _$$DrugModelImplToJson(_$DrugModelImpl instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'genericName': instance.genericName,
      'manufacturerName': instance.manufacturerName,
      'url': instance.url,
      'bookmarked': instance.bookmarked,
    };
