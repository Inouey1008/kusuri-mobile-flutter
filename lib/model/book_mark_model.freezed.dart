// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_mark_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BookMarkModel _$BookMarkModelFromJson(Map<String, dynamic> json) {
  return _BookMarkModel.fromJson(json);
}

/// @nodoc
mixin _$BookMarkModel {
  String get id => throw _privateConstructorUsedError;
  String get userID => throw _privateConstructorUsedError;
  String? get productName => throw _privateConstructorUsedError;
  String? get genericName => throw _privateConstructorUsedError;
  String? get manufacturerName => throw _privateConstructorUsedError;
  String? get originalURL => throw _privateConstructorUsedError;
  String? get storageRefURL => throw _privateConstructorUsedError;
  DrugType? get drugType => throw _privateConstructorUsedError;
  @ISODateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @ISODateTimeConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookMarkModelCopyWith<BookMarkModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookMarkModelCopyWith<$Res> {
  factory $BookMarkModelCopyWith(
          BookMarkModel value, $Res Function(BookMarkModel) then) =
      _$BookMarkModelCopyWithImpl<$Res, BookMarkModel>;
  @useResult
  $Res call(
      {String id,
      String userID,
      String? productName,
      String? genericName,
      String? manufacturerName,
      String? originalURL,
      String? storageRefURL,
      DrugType? drugType,
      @ISODateTimeConverter() DateTime? createdAt,
      @ISODateTimeConverter() DateTime? updatedAt});
}

/// @nodoc
class _$BookMarkModelCopyWithImpl<$Res, $Val extends BookMarkModel>
    implements $BookMarkModelCopyWith<$Res> {
  _$BookMarkModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userID = null,
    Object? productName = freezed,
    Object? genericName = freezed,
    Object? manufacturerName = freezed,
    Object? originalURL = freezed,
    Object? storageRefURL = freezed,
    Object? drugType = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      genericName: freezed == genericName
          ? _value.genericName
          : genericName // ignore: cast_nullable_to_non_nullable
              as String?,
      manufacturerName: freezed == manufacturerName
          ? _value.manufacturerName
          : manufacturerName // ignore: cast_nullable_to_non_nullable
              as String?,
      originalURL: freezed == originalURL
          ? _value.originalURL
          : originalURL // ignore: cast_nullable_to_non_nullable
              as String?,
      storageRefURL: freezed == storageRefURL
          ? _value.storageRefURL
          : storageRefURL // ignore: cast_nullable_to_non_nullable
              as String?,
      drugType: freezed == drugType
          ? _value.drugType
          : drugType // ignore: cast_nullable_to_non_nullable
              as DrugType?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookMarkModelImplCopyWith<$Res>
    implements $BookMarkModelCopyWith<$Res> {
  factory _$$BookMarkModelImplCopyWith(
          _$BookMarkModelImpl value, $Res Function(_$BookMarkModelImpl) then) =
      __$$BookMarkModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userID,
      String? productName,
      String? genericName,
      String? manufacturerName,
      String? originalURL,
      String? storageRefURL,
      DrugType? drugType,
      @ISODateTimeConverter() DateTime? createdAt,
      @ISODateTimeConverter() DateTime? updatedAt});
}

/// @nodoc
class __$$BookMarkModelImplCopyWithImpl<$Res>
    extends _$BookMarkModelCopyWithImpl<$Res, _$BookMarkModelImpl>
    implements _$$BookMarkModelImplCopyWith<$Res> {
  __$$BookMarkModelImplCopyWithImpl(
      _$BookMarkModelImpl _value, $Res Function(_$BookMarkModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userID = null,
    Object? productName = freezed,
    Object? genericName = freezed,
    Object? manufacturerName = freezed,
    Object? originalURL = freezed,
    Object? storageRefURL = freezed,
    Object? drugType = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$BookMarkModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      genericName: freezed == genericName
          ? _value.genericName
          : genericName // ignore: cast_nullable_to_non_nullable
              as String?,
      manufacturerName: freezed == manufacturerName
          ? _value.manufacturerName
          : manufacturerName // ignore: cast_nullable_to_non_nullable
              as String?,
      originalURL: freezed == originalURL
          ? _value.originalURL
          : originalURL // ignore: cast_nullable_to_non_nullable
              as String?,
      storageRefURL: freezed == storageRefURL
          ? _value.storageRefURL
          : storageRefURL // ignore: cast_nullable_to_non_nullable
              as String?,
      drugType: freezed == drugType
          ? _value.drugType
          : drugType // ignore: cast_nullable_to_non_nullable
              as DrugType?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookMarkModelImpl implements _BookMarkModel {
  const _$BookMarkModelImpl(
      {required this.id,
      required this.userID,
      required this.productName,
      required this.genericName,
      required this.manufacturerName,
      required this.originalURL,
      required this.storageRefURL,
      required this.drugType,
      @ISODateTimeConverter() required this.createdAt,
      @ISODateTimeConverter() required this.updatedAt});

  factory _$BookMarkModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookMarkModelImplFromJson(json);

  @override
  final String id;
  @override
  final String userID;
  @override
  final String? productName;
  @override
  final String? genericName;
  @override
  final String? manufacturerName;
  @override
  final String? originalURL;
  @override
  final String? storageRefURL;
  @override
  final DrugType? drugType;
  @override
  @ISODateTimeConverter()
  final DateTime? createdAt;
  @override
  @ISODateTimeConverter()
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'BookMarkModel(id: $id, userID: $userID, productName: $productName, genericName: $genericName, manufacturerName: $manufacturerName, originalURL: $originalURL, storageRefURL: $storageRefURL, drugType: $drugType, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookMarkModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userID, userID) || other.userID == userID) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.genericName, genericName) ||
                other.genericName == genericName) &&
            (identical(other.manufacturerName, manufacturerName) ||
                other.manufacturerName == manufacturerName) &&
            (identical(other.originalURL, originalURL) ||
                other.originalURL == originalURL) &&
            (identical(other.storageRefURL, storageRefURL) ||
                other.storageRefURL == storageRefURL) &&
            (identical(other.drugType, drugType) ||
                other.drugType == drugType) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userID,
      productName,
      genericName,
      manufacturerName,
      originalURL,
      storageRefURL,
      drugType,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookMarkModelImplCopyWith<_$BookMarkModelImpl> get copyWith =>
      __$$BookMarkModelImplCopyWithImpl<_$BookMarkModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookMarkModelImplToJson(
      this,
    );
  }
}

abstract class _BookMarkModel implements BookMarkModel {
  const factory _BookMarkModel(
          {required final String id,
          required final String userID,
          required final String? productName,
          required final String? genericName,
          required final String? manufacturerName,
          required final String? originalURL,
          required final String? storageRefURL,
          required final DrugType? drugType,
          @ISODateTimeConverter() required final DateTime? createdAt,
          @ISODateTimeConverter() required final DateTime? updatedAt}) =
      _$BookMarkModelImpl;

  factory _BookMarkModel.fromJson(Map<String, dynamic> json) =
      _$BookMarkModelImpl.fromJson;

  @override
  String get id;
  @override
  String get userID;
  @override
  String? get productName;
  @override
  String? get genericName;
  @override
  String? get manufacturerName;
  @override
  String? get originalURL;
  @override
  String? get storageRefURL;
  @override
  DrugType? get drugType;
  @override
  @ISODateTimeConverter()
  DateTime? get createdAt;
  @override
  @ISODateTimeConverter()
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$BookMarkModelImplCopyWith<_$BookMarkModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
