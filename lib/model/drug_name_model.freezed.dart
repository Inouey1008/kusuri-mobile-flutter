// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drug_name_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DrugNameModel _$DrugNameModelFromJson(Map<String, dynamic> json) {
  return _DrugNameModel.fromJson(json);
}

/// @nodoc
mixin _$DrugNameModel {
  @JsonKey(name: 'original_name')
  String? get originalName => throw _privateConstructorUsedError;
  @JsonKey(name: 'processed_name')
  String? get processedName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DrugNameModelCopyWith<DrugNameModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrugNameModelCopyWith<$Res> {
  factory $DrugNameModelCopyWith(
          DrugNameModel value, $Res Function(DrugNameModel) then) =
      _$DrugNameModelCopyWithImpl<$Res, DrugNameModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'original_name') String? originalName,
      @JsonKey(name: 'processed_name') String? processedName});
}

/// @nodoc
class _$DrugNameModelCopyWithImpl<$Res, $Val extends DrugNameModel>
    implements $DrugNameModelCopyWith<$Res> {
  _$DrugNameModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originalName = freezed,
    Object? processedName = freezed,
  }) {
    return _then(_value.copyWith(
      originalName: freezed == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String?,
      processedName: freezed == processedName
          ? _value.processedName
          : processedName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DrugNameModelImplCopyWith<$Res>
    implements $DrugNameModelCopyWith<$Res> {
  factory _$$DrugNameModelImplCopyWith(
          _$DrugNameModelImpl value, $Res Function(_$DrugNameModelImpl) then) =
      __$$DrugNameModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'original_name') String? originalName,
      @JsonKey(name: 'processed_name') String? processedName});
}

/// @nodoc
class __$$DrugNameModelImplCopyWithImpl<$Res>
    extends _$DrugNameModelCopyWithImpl<$Res, _$DrugNameModelImpl>
    implements _$$DrugNameModelImplCopyWith<$Res> {
  __$$DrugNameModelImplCopyWithImpl(
      _$DrugNameModelImpl _value, $Res Function(_$DrugNameModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originalName = freezed,
    Object? processedName = freezed,
  }) {
    return _then(_$DrugNameModelImpl(
      originalName: freezed == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String?,
      processedName: freezed == processedName
          ? _value.processedName
          : processedName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DrugNameModelImpl implements _DrugNameModel {
  const _$DrugNameModelImpl(
      {@JsonKey(name: 'original_name') required this.originalName,
      @JsonKey(name: 'processed_name') required this.processedName});

  factory _$DrugNameModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DrugNameModelImplFromJson(json);

  @override
  @JsonKey(name: 'original_name')
  final String? originalName;
  @override
  @JsonKey(name: 'processed_name')
  final String? processedName;

  @override
  String toString() {
    return 'DrugNameModel(originalName: $originalName, processedName: $processedName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DrugNameModelImpl &&
            (identical(other.originalName, originalName) ||
                other.originalName == originalName) &&
            (identical(other.processedName, processedName) ||
                other.processedName == processedName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, originalName, processedName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DrugNameModelImplCopyWith<_$DrugNameModelImpl> get copyWith =>
      __$$DrugNameModelImplCopyWithImpl<_$DrugNameModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DrugNameModelImplToJson(
      this,
    );
  }
}

abstract class _DrugNameModel implements DrugNameModel {
  const factory _DrugNameModel(
      {@JsonKey(name: 'original_name') required final String? originalName,
      @JsonKey(name: 'processed_name')
      required final String? processedName}) = _$DrugNameModelImpl;

  factory _DrugNameModel.fromJson(Map<String, dynamic> json) =
      _$DrugNameModelImpl.fromJson;

  @override
  @JsonKey(name: 'original_name')
  String? get originalName;
  @override
  @JsonKey(name: 'processed_name')
  String? get processedName;
  @override
  @JsonKey(ignore: true)
  _$$DrugNameModelImplCopyWith<_$DrugNameModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
