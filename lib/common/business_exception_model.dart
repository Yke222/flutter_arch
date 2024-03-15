import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_exception_model.freezed.dart';

@freezed
class BusinessExceptionModel with _$BusinessExceptionModel {
  const factory BusinessExceptionModel({
    @JsonKey(name: 'code') String? code,
    @JsonKey(name: 'message') String? message,
  }) = _BusinessExceptionModel;

  factory BusinessExceptionModel.fromJson(Map<String, dynamic> json) =>
      _$BusinessExceptionModelFromJson(json);
}
