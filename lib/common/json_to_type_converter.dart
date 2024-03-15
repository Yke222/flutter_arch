import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter_arch/common/business_exception_model.dart';
import 'package:flutter_arch/common/json_to_type_parser.dart';

class JsonToTypeConverter extends JsonConverter {
  // All responses from the server side, will be handled here.
  @override
  Future<Response<ResultType>> convertResponse<ResultType, Item>(
    Response<dynamic> response,
  ) async {
    final jsonRes = super.convertResponse<dynamic, dynamic>(response);

    if (jsonRes is Future<Response<dynamic>>) {
      final res = await jsonRes;

      if (res.body == null ||
          (res.body is String && (res.body as String).isEmpty)) {
        return res.copyWith(body: null);
      }

      final dynamic decodedItem = JsonTypeParser.decode<Item>(res.body);

      return res.copyWith<ResultType>(body: decodedItem as ResultType);
    } else {
      return jsonRes as Response<ResultType>;
    }
  }

  // All errors from the server side, will be handled here.
  @override
  Future<Response<BusinessExceptionModel>> convertError<ResultType, Item>(
    Response<dynamic> response,
  ) async {
    final jsonRes = super.convertResponse<dynamic, dynamic>(response);

    if (jsonRes is Future<Response<dynamic>>) {
      final res = await jsonRes;

      if (res.body == null ||
          (res.body is String && (res.body as String).isEmpty)) {
        return res.copyWith(body: null);
      }

      final dynamic decodedItem =
          JsonTypeParser.decode<BusinessExceptionModel>(res.body);

      return res.copyWith<BusinessExceptionModel>(
        body: decodedItem as BusinessExceptionModel,
      );
    } else {
      return jsonRes as Response<BusinessExceptionModel>;
    }
  }

  // All requests that will be sent by the application, will be handled here.
  @override
  Request convertRequest(Request request) {
    final startingJson = super.convertRequest(request);

    final decode = json.decode(startingJson.body as String);

    if (decode != null) {
      final map = Map<String, dynamic>.from(decode as Map);

      final sendElement = json.encode(map);

      return startingJson.copyWith(body: sendElement);
    }

    return startingJson;
  }
}
