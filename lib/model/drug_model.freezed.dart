// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drug_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DrugModel _$DrugModelFromJson(Map<String, dynamic> json) {
  return _DrugModel.fromJson(json);
}

/// @nodoc
mixin _$DrugModel {
  String? get productName => throw _privateConstructorUsedError;
  String? get genericName => throw _privateConstructorUsedError;
  String? get manufacturerName => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  bool? get bookmarked => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DrugModelCopyWith<DrugModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrugModelCopyWith<$Res> {
  factory $DrugModelCopyWith(DrugModel value, $Res Function(DrugModel) then) =
      _$DrugModelCopyWithImpl<$Res, DrugModel>;
  @useResult
  $Res call(
      {String? productName,
      String? genericName,
      String? manufacturerName,
      String? url,
      bool? bookmarked});
}

/// @nodoc
class _$DrugModelCopyWithImpl<$Res, $Val extends DrugModel>
    implements $DrugModelCopyWith<$Res> {
  _$DrugModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productName = freezed,
    Object? genericName = freezed,
    Object? manufacturerName = freezed,
    Object? url = freezed,
    Object? bookmarked = freezed,
  }) {
    return _then(_value.copyWith(
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
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      bookmarked: freezed == bookmarked
          ? _value.bookmarked
          : bookmarked // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DrugModelImplCopyWith<$Res>
    implements $DrugModelCopyWith<$Res> {
  factory _$$DrugModelImplCopyWith(
          _$DrugModelImpl value, $Res Function(_$DrugModelImpl) then) =
      __$$DrugModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? productName,
      String? genericName,
      String? manufacturerName,
      String? url,
      bool? bookmarked});
}

/// @nodoc
class __$$DrugModelImplCopyWithImpl<$Res>
    extends _$DrugModelCopyWithImpl<$Res, _$DrugModelImpl>
    implements _$$DrugModelImplCopyWith<$Res> {
  __$$DrugModelImplCopyWithImpl(
      _$DrugModelImpl _value, $Res Function(_$DrugModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productName = freezed,
    Object? genericName = freezed,
    Object? manufacturerName = freezed,
    Object? url = freezed,
    Object? bookmarked = freezed,
  }) {
    return _then(_$DrugModelImpl(
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
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      bookmarked: freezed == bookmarked
          ? _value.bookmarked
          : bookmarked // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DrugModelImpl implements _DrugModel {
  const _$DrugModelImpl(
      {required this.productName,
      required this.genericName,
      required this.manufacturerName,
      required this.url,
      this.bookmarked});

  factory _$DrugModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DrugModelImplFromJson(json);

  @override
  final String? productName;
  @override
  final String? genericName;
  @override
  final String? manufacturerName;
  @override
  final String? url;
  @override
  final bool? bookmarked;

  @override
  String toString() {
    return 'DrugModel(productName: $productName, genericName: $genericName, manufacturerName: $manufacturerName, url: $url, bookmarked: $bookmarked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DrugModelImpl &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.genericName, genericName) ||
                other.genericName == genericName) &&
            (identical(other.manufacturerName, manufacturerName) ||
                other.manufacturerName == manufacturerName) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.bookmarked, bookmarked) ||
                other.bookmarked == bookmarked));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, productName, genericName, manufacturerName, url, bookmarked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DrugModelImplCopyWith<_$DrugModelImpl> get copyWith =>
      __$$DrugModelImplCopyWithImpl<_$DrugModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DrugModelImplToJson(
      this,
    );
  }
}

abstract class _DrugModel implements DrugModel {
  const factory _DrugModel(
      {required final String? productName,
      required final String? genericName,
      required final String? manufacturerName,
      required final String? url,
      final bool? bookmarked}) = _$DrugModelImpl;

  factory _DrugModel.fromJson(Map<String, dynamic> json) =
      _$DrugModelImpl.fromJson;

  @override
  String? get productName;
  @override
  String? get genericName;
  @override
  String? get manufacturerName;
  @override
  String? get url;
  @override
  bool? get bookmarked;
  @override
  @JsonKey(ignore: true)
  _$$DrugModelImplCopyWith<_$DrugModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
