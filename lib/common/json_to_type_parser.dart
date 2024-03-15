import 'package:flutter_arch/common/business_exception_model.dart';

typedef JsonFactory<T> = T Function(Map<String, dynamic> json);

class JsonTypeParser {
  static const Map<Type, JsonFactory<dynamic>> factories = {
    // Register all factories here
    BusinessExceptionModel: BusinessExceptionModel.fromJson,
  };

  static dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) return _decodeList<T>(entity);

    if (entity is Map<String, dynamic>) return _decodeMap<T>(entity);

    return entity;
  }

  static T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];

    if (jsonFactory == null || jsonFactory is! JsonFactory<T>) {
      throw UnsupportedError('Unsupported type: $T');
    }

    return jsonFactory(values);
  }

  static List<T> _decodeList<T>(Iterable<dynamic> values) => values
      .where((dynamic v) => v != null)
      .map((dynamic v) => decode<T>(v) as T)
      .toList();
}
