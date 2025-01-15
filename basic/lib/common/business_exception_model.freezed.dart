// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_exception_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BusinessExceptionModel _$BusinessExceptionModelFromJson(
    Map<String, dynamic> json) {
  return _BusinessExceptionModel.fromJson(json);
}

/// @nodoc
mixin _$BusinessExceptionModel {
  @JsonKey(name: 'code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BusinessExceptionModelCopyWith<BusinessExceptionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessExceptionModelCopyWith<$Res> {
  factory $BusinessExceptionModelCopyWith(BusinessExceptionModel value,
          $Res Function(BusinessExceptionModel) then) =
      _$BusinessExceptionModelCopyWithImpl<$Res, BusinessExceptionModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'code') String? code,
      @JsonKey(name: 'message') String? message});
}

/// @nodoc
class _$BusinessExceptionModelCopyWithImpl<$Res,
        $Val extends BusinessExceptionModel>
    implements $BusinessExceptionModelCopyWith<$Res> {
  _$BusinessExceptionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BusinessExceptionModelImplCopyWith<$Res>
    implements $BusinessExceptionModelCopyWith<$Res> {
  factory _$$BusinessExceptionModelImplCopyWith(
          _$BusinessExceptionModelImpl value,
          $Res Function(_$BusinessExceptionModelImpl) then) =
      __$$BusinessExceptionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'code') String? code,
      @JsonKey(name: 'message') String? message});
}

/// @nodoc
class __$$BusinessExceptionModelImplCopyWithImpl<$Res>
    extends _$BusinessExceptionModelCopyWithImpl<$Res,
        _$BusinessExceptionModelImpl>
    implements _$$BusinessExceptionModelImplCopyWith<$Res> {
  __$$BusinessExceptionModelImplCopyWithImpl(
      _$BusinessExceptionModelImpl _value,
      $Res Function(_$BusinessExceptionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
  }) {
    return _then(_$BusinessExceptionModelImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BusinessExceptionModelImpl implements _BusinessExceptionModel {
  const _$BusinessExceptionModelImpl(
      {@JsonKey(name: 'code') this.code,
      @JsonKey(name: 'message') this.message});

  factory _$BusinessExceptionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BusinessExceptionModelImplFromJson(json);

  @override
  @JsonKey(name: 'code')
  final String? code;
  @override
  @JsonKey(name: 'message')
  final String? message;

  @override
  String toString() {
    return 'BusinessExceptionModel(code: $code, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusinessExceptionModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BusinessExceptionModelImplCopyWith<_$BusinessExceptionModelImpl>
      get copyWith => __$$BusinessExceptionModelImplCopyWithImpl<
          _$BusinessExceptionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusinessExceptionModelImplToJson(
      this,
    );
  }
}

abstract class _BusinessExceptionModel implements BusinessExceptionModel {
  const factory _BusinessExceptionModel(
          {@JsonKey(name: 'code') final String? code,
          @JsonKey(name: 'message') final String? message}) =
      _$BusinessExceptionModelImpl;

  factory _BusinessExceptionModel.fromJson(Map<String, dynamic> json) =
      _$BusinessExceptionModelImpl.fromJson;

  @override
  @JsonKey(name: 'code')
  String? get code;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$BusinessExceptionModelImplCopyWith<_$BusinessExceptionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
