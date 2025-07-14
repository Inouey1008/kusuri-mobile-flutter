import 'package:json_annotation/json_annotation.dart';

class ISODateTimeConverter implements JsonConverter<DateTime, String> {
  const ISODateTimeConverter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json);

  @override
  String toJson(DateTime object) => object.toUtc().toIso8601String();
}
